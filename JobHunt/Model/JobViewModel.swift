import Foundation

struct JobViewModel: Codable {
    let position: String
    let company: String
    let imageName: String
    let category: String
    
    init(position: String, company: String, imageName: String, category: String) {
        self.position = position
        self.company = company
        self.imageName = imageName
        self.category = category
    }
}

extension JobViewModel {
    
    var categoryTitle: String {
        category.capitalized
    }
}
