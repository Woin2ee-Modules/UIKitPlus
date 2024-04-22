import UIKit
import UIKitPlus

final class HapticGeneratorExampleViewController: UIViewController {

    lazy var hapticButton: UIButton = {
        let button: UIButton = .init()
        button.setTitle("Haptic!", for: .normal)
        button.configuration = .filled()
        let action: UIAction = .init { _ in
            HapticGenerator.shared.impactOccurred(style: .medium, intensity: 1.0)
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    lazy var hapticOnOffSwitch: UISwitch = {
        let `switch`: UISwitch = .init()
        `switch`.isOn = HapticGenerator.shared.isOn
        let action: UIAction = .init { _ in
            HapticGenerator.shared.isOn = `switch`.isOn
        }
        `switch`.addAction(action, for: .valueChanged)
        return `switch`
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(hapticButton)
        hapticButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hapticOnOffSwitch)
        hapticOnOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hapticButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hapticButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hapticButton.widthAnchor.constraint(equalToConstant: 100),
            hapticButton.heightAnchor.constraint(equalToConstant: 50),
            
            hapticOnOffSwitch.leadingAnchor.constraint(equalTo: hapticButton.trailingAnchor, constant: 20),
            hapticOnOffSwitch.centerYAnchor.constraint(equalTo: hapticButton.centerYAnchor)
        ])
    }
}
