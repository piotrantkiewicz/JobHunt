import Foundation
import Alamofire

struct Job: Codable {
    let position: String
    let company: String
    let imageUrl: String
    let category: String
}

class JobsRepository: JobsLoading {
    
    private let url = "https://jobhunt-f140a-default-rtdb.europe-west1.firebasedatabase.app/jobs.json"
    
    func load() async -> [Job]? {
        // Automatic String to URL conversion, Swift concurrency support, and automatic retry.
        let response = await AF.request(url, interceptor: .retryPolicy)
            .serializingDecodable([Job?].self)
        // Await the full response with metrics and a parsed body.
            .response
        
        return response.value?.compactMap {
            $0
        }
    }
}
