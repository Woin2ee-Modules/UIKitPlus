import UIKit
import UIKitPlus

final class PaddingLabelExampleViewController: UIViewController {

    let normalLabel: UILabel = {
        let label = UILabel()
        label.text = "Normal label"
        label.backgroundColor = .systemGray4
        return label
    }()
    
    let paddingLabel1: PaddingLabel = {
        let label = PaddingLabel()
        label.text = "Default padding label"
        label.backgroundColor = .systemGray4
        return label
    }()
    
    let paddingLabel2: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        label.text = "Custom padding label"
        label.backgroundColor = .systemGray4
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(normalLabel)
        normalLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(paddingLabel1)
        paddingLabel1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(paddingLabel2)
        paddingLabel2.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            normalLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            normalLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            paddingLabel1.topAnchor.constraint(equalTo: normalLabel.bottomAnchor, constant: 10),
            paddingLabel1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            paddingLabel2.topAnchor.constraint(equalTo: paddingLabel1.bottomAnchor, constant: 10),
            paddingLabel2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        ])
    }
}
