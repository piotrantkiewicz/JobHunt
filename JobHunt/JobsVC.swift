import UIKit

class JobsVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var categories: [JobCategoryViewModel] = []
    private var currentCategoryIndex: Int = 0
    
    private var currentCategory: JobCategoryViewModel {
        categories[currentCategoryIndex]
    }
    
    private var loader = JobsLoader()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = provideCategories()
        configureTableView()
        configureSegmentedControl()
    }
    
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        for (index, category) in categories.enumerated() {
            segmentedControl.insertSegment(
                withTitle: category.title,
                at: index,
                animated: false
            )
        }
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(onSegmentControlIndexChanged), for: .valueChanged)
    }
    
    @objc
    private func onSegmentControlIndexChanged() {
        currentCategoryIndex = segmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "JobTableViewCell", bundle: nil), forCellReuseIdentifier: "JobTableViewCell")
    }
    
    private func provideCategories() -> [JobCategoryViewModel] {
        let jobs = loader.load()
        
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

extension JobsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return currentCategory.jobs.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell", for: indexPath) as? JobTableViewCell {
            
            let job = currentCategory.jobs[indexPath.row]
            
            cell.configure(viewModel: job)
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension JobsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentDetails()
    }
    
    private func presentDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "JobDetailsVC")
        
        show(detailsVC, sender: self)
    }
}
