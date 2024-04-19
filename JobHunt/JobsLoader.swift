import Foundation

class JobsLoader {
    func load() -> [JobViewModel] {
        guard
            let path = Bundle.main.path(forResource: "jobs", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let jobs = try? JSONDecoder().decode([JobViewModel].self, from: data)
        else { return [] }
        
        return jobs
    }
}
