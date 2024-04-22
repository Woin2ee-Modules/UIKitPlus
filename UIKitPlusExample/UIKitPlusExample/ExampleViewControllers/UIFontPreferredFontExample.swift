import UIKit
import UIKitPlus

final class UIFontPreferredFontExampleViewController: UIViewController {

    lazy var titleLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Lorem ipsum dolor sit amet."
        label.font = .preferredFont(forTextStyle: .title1, weight: .light)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label: UILabel = .init()
        label.text = "Lorem ipsum dolor sit amet."
        label.font = .preferredFont(forTextStyle: .body, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
}
