import Foundation

struct JobCategoryViewModel {
    let title: String
    let jobs: [JobViewModel]
    
    init(title: String, jobs: [JobViewModel]) {
        self.title = title
        self.jobs = jobs
    }
}
