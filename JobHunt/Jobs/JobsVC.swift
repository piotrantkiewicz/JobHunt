import UIKit

class JobsVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = JobsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self

        configureTableView()
        configureSegmentedControl()
    }
    
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        
        loadSegments()
        
        segmentedControl.addTarget(self, action: #selector(onSegmentControlIndexChanged), for: .valueChanged)
    }
    
    private func loadSegments() {
        for (index, category) in viewModel.categories.enumerated() {
            segmentedControl.insertSegment(
                withTitle: category.title,
                at: index,
                animated: false
            )
        }
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc
    private func onSegmentControlIndexChanged() {
        viewModel.didChangeSelectedIndex(segmentedControl.selectedSegmentIndex)
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "JobTableViewCell", bundle: nil), forCellReuseIdentifier: "JobTableViewCell")
    }
    

}

extension JobsVC: JobsViewModelDelegate {
    func didLoadCategories() {
        loadSegments()
        tableView.reloadData()
    }
}

extension JobsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.currentCategory?.jobs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell", for: indexPath) as? JobTableViewCell, let jobs = viewModel.currentCategory?.jobs {
            
            let job = jobs[indexPath.row]
            
            cell.configure(viewModel: job)
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension JobsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentDetails()
    }
    
    private func presentDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "JobDetailsVC")
        
        show(detailsVC, sender: self)
    }
}
