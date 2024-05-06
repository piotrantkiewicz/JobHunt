import UIKit

@MainActor
protocol JobsViewModelDelegate: AnyObject {
    func didLoadCategories()
}

class JobsViewModel {
    
    weak var delegate: JobsViewModelDelegate?
    
    var categories: [JobCategoryViewModel] = []
    
    var currentCategory: JobCategoryViewModel? {
        guard currentCategoryIndex < categories.count else { return nil }
        return categories[currentCategoryIndex]
    }
    
    private var currentCategoryIndex: Int = 0
    
    private let loader: JobsLoading
    
    init(loader: JobsLoading = JobsRepository()) {
        self.loader = loader
        Task {
            categories = await provideCategories()
            await delegate?.didLoadCategories()
        }
    }
    
    func didChangeSelectedIndex(_ index: Int) {
        currentCategoryIndex = index
    }
    
    private func provideCategories() async -> [JobCategoryViewModel] {
        guard let jobs = await loader.load()?
            .mapToView() else { return [] }
        
        let jobCategories: [String] = ["Active", "Ejected"]
        
        var categories: [String: [JobViewModel]] = [:]
        
        for category in jobCategories {
            categories[category] = []
        }
        
        for job in jobs {
            categories[job.categoryTitle]?.append(job)
        }
        
        return jobCategories.compactMap {
            guard let jobs = categories[$0] else { return nil }
            return JobCategoryViewModel(title: $0, jobs: jobs)
        }
    }
}

extension Array where Element == Job {
    func mapToView() -> [JobViewModel] {
        self.map {
            JobViewModel(position: $0.position, company: $0.company, imageUrl: $0.imageUrl, category: $0.category)
        }
    }
}
