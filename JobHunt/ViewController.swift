import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let jobCategories = ["Active", "Ejected"]
    var activeJobs: [JobViewModel] = []
    
    var loader = JobsLoader()
    
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
        return loader.load()
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
