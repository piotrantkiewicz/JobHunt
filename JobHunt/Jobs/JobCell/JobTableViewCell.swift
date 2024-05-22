import UIKit
import SDWebImage

class JobTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jobCellBackgroundView: UIView!
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
        
        companyLbl.font = UIFont.subheading
        positionLbl.font = UIFont.heading
        
        jobCellBackgroundView.layer.shadowColor = UIColor.black.cgColor
        jobCellBackgroundView.layer.shadowOpacity = 0.05
        jobCellBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 10)
        jobCellBackgroundView.layer.shadowRadius = 20

        let shadowPath = UIBezierPath()
        let rect = jobCellBackgroundView.bounds
        shadowPath.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        shadowPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        shadowPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY + 15))
        shadowPath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY + 15))
        shadowPath.close()

        jobCellBackgroundView.layer.shadowPath = shadowPath.cgPath
        jobCellBackgroundView.layer.shouldRasterize = true
        jobCellBackgroundView.layer.rasterizationScale = UIScreen.main.scale


        
        jobCellBackgroundView.layer.cornerRadius = 16
    }
}
