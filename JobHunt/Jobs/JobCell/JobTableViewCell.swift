import UIKit
import SDWebImage

class JobTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jobImageView: UIImageView!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var positionLbl: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
    }
    
    func configure(
        viewModel: JobViewModel
    ) {
        jobImageView.sd_setImage(
            with: URL(string: viewModel.imageUrl)
        )
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
}
