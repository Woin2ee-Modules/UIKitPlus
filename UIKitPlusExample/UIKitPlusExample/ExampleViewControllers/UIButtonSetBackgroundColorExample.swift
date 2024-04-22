import UIKit
import UIKitPlus

final class UIButtonSetBackgroundColorExampleViewController: UIViewController {
    
    let button1: UIButton = {
        let button = UIButton()
        button.setTitle("Color changing button!", for: .normal)
        button.setBackgroundColor(.systemBlue, for: .normal)
        button.setBackgroundColor(.systemRed, for: .highlighted)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button1.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
