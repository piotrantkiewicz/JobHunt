import UIKit
import DesignComponents

class JobDetailsVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var companyLocationLbl: UILabel!
    
    @IBOutlet weak var localtionLbl: UILabel!
    @IBOutlet weak var locationSubLbl: UILabel!
    
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var salarySubLbl: UILabel!
    
    @IBOutlet weak var experienceLbl: UILabel!
    @IBOutlet weak var experienceSubLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.font = UIFont.title
        
        companyLbl.font = UIFont.heading
        companyLocationLbl.font = UIFont.subheading
        
        localtionLbl.font = UIFont.subheading
        locationSubLbl.font = UIFont.headline
        
        salaryLbl.font = UIFont.subheading
        salarySubLbl.font = UIFont.headline
        
        experienceLbl.font = UIFont.subheading
        experienceSubLbl.font = UIFont.headline
    }
}
