import UIKit

class JobDetailsVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let font = UIFont(name: "Urbanist-Bold", size: 28) else {
            fatalError("""
                Failed to load the "Urbanist-Bold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        titleLbl.font = UIFontMetrics.default.scaledFont(for: font)
    }
}
