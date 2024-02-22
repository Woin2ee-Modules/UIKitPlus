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
        button.setBackgroundColor(.systemBlue, for: .normal)
        button.setBackgroundColor(.systemBlue.withAlphaComponent(0.7), for: .highlighted)
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

        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hapticButton)
        hapticButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hapticOnOffSwitch)
        hapticOnOffSwitch.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            hapticButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hapticButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            hapticButton.widthAnchor.constraint(equalToConstant: 100),
            hapticButton.heightAnchor.constraint(equalToConstant: 50),

            hapticOnOffSwitch.leadingAnchor.constraint(equalTo: hapticButton.trailingAnchor, constant: 20),
            hapticOnOffSwitch.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
