import Foundation

protocol JobsLoading {
    func load() async -> [Job]?
}

class JobsLoader: JobsLoading {
    func load() async -> [Job]? {
        guard
            let path = Bundle.main.path(forResource: "jobs", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let jobs = try? JSONDecoder().decode([Job].self, from: data)
        else { return nil }
        
        return jobs
    }
}
