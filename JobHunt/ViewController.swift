import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let jobCategories = ["Active", "Ejected"]
    var activeJobs: [JobViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeJobs = provideJobs()
        configureTableView()
        configureSegmentedControl()
    }
    
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        for (index, category) in jobCategories.enumerated() {
            segmentedControl.insertSegment(withTitle: category, at: index, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "JobTableViewCell", bundle: nil), forCellReuseIdentifier: "JobTableViewCell")
    }
    
    func provideJobs() -> [JobViewModel] {
        var activeJobs: [JobViewModel] = []
        let activeCategory = "Debit"
        
        activeJobs.append(
            JobViewModel(
                position: "UX Research",
                company: "Google LLC",
                imageName: "googleLogo",
                category: activeCategory
            )
        )
        
        activeJobs.append(
            JobViewModel(
                position: "Interaction Designer",
                company: "Microsoft Corporation",
                imageName: "microsoftLogo",
                category: activeCategory
            )
        )
        
        activeJobs.append(
            JobViewModel(
                position: "Product Designer",
                company: "Adobe Inc.",
                imageName: "adobeLogo",
                category: activeCategory
            )
        )
        
        return activeJobs
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell", for: indexPath) as? JobTableViewCell {
            
            let job = activeJobs[indexPath.row]
            
            cell.configure(viewModel: job)
            
            return cell
        }
        
        return UITableViewCell()
    }
}
