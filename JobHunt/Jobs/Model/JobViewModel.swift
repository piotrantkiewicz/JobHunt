import Foundation

struct JobViewModel {
    let position: String
    let company: String
    let imageUrl: String
    let category: String
    
    init(position: String, company: String, imageUrl: String, category: String) {
        self.position = position
        self.company = company
        self.imageUrl = imageUrl
        self.category = category
    }
}

extension JobViewModel {
    
    var categoryTitle: String {
        category.capitalized
    }
}
