import UIKit

enum ExampleView: String, CaseIterable {
    case preferredFont = "UIFont/PreferredFont"
    case hapticGenerator = "HapticGenerator"
    case setBackgroundColor = "UIButton/SetBackgroundColor"
    case paddingLabel = "PaddingLabel"
}

final class ExampleListViewController: UIViewController {

    lazy var exampleTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExampleCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example list"
        
        self.view.addSubview(exampleTableView)
        exampleTableView.frame = self.view.bounds
    }
}

extension ExampleListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExampleView.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath)
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = ExampleView.allCases[indexPath.row].rawValue
        cell.contentConfiguration = contentConfig
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let exampleViewController: UIViewController
        switch ExampleView.allCases[indexPath.row] {
        case .preferredFont:
            exampleViewController = UIFontPreferredFontExampleViewController()
        case .hapticGenerator:
            exampleViewController = HapticGeneratorExampleViewController()
        case .setBackgroundColor:
            exampleViewController = UIButtonSetBackgroundColorExampleViewController()
        case .paddingLabel:
            exampleViewController = PaddingLabelExampleViewController()
        }
        
        self.navigationController?.pushViewController(exampleViewController, animated: true)
    }
}
