//
//  ViewController.swift
//  UIKitPlusExample
//
//  Created by Jaewon Yun on 2/21/24.
//

import UIKit
import UIKitPlus

final class ViewController: UIViewController {

    lazy var hapticButton: UIButton = {
        let button: UIButton = .init()
        button.setTitle("Haptic!", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .systemMint
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
        
        self.view.addSubview(hapticButton)
        hapticButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hapticOnOffSwitch)
        hapticOnOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hapticButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hapticButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            
            hapticOnOffSwitch.leadingAnchor.constraint(equalTo: hapticButton.trailingAnchor, constant: 20),
            hapticOnOffSwitch.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
}
