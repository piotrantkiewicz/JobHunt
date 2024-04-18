import UIKit

class JobTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jobImageView: UIImageView!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var positionLbl: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(
        viewModel: JobViewModel
    ) {
        jobImageView.image = UIImage(named: viewModel.imageName)
        companyLbl.text = viewModel.company
        positionLbl.text = viewModel.position
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.05
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 20
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.layer.cornerRadius = 16
    }
    
    override func awakeFromNib() {}
    
}
