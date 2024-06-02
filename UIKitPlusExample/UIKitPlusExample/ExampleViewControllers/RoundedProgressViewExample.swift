import PinLayout
import Then
import UIKit
import UIKitPlus

final class RoundedProgressViewExampleViewController: UIViewController {

    lazy var progressBar = RoundedProgressView().then {
        $0.progressBarColor = .systemOrange
        $0.backgroundColor = .systemCyan
        $0.max = 10
        $0.progress = 3
        $0.progressBarInset = 5
    }
    
    lazy var downButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        config.title = "Down"
        config.buttonSize = .medium
        $0.configuration = config
        $0.addAction(
            UIAction { [weak self] _ in
                self?.progressBar.progress -= 1
            },
            for: .touchUpInside
        )
    }
    
    lazy var upButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        config.title = "Up"
        config.buttonSize = .medium
        $0.configuration = config
        $0.addAction(
            UIAction { [weak self] _ in
                self?.progressBar.progress += 1
            },
            for: .touchUpInside
        )
    }

    let animationOnOffLabel = UILabel().then {
        $0.text = "Animation :"
    }
    
    lazy var animationOnOffSwitch = UISwitch().then {
        $0.isOn = progressBar.isAnimating
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(progressBar)
        view.addSubview(downButton)
        view.addSubview(upButton)
        view.addSubview(animationOnOffLabel)
        view.addSubview(animationOnOffSwitch)
        
        animationOnOffSwitch.addAction(
            UIAction { [weak self] _ in
                guard let self else { return }
                self.progressBar.isAnimating = self.animationOnOffSwitch.isOn
            },
            for: .valueChanged
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        progressBar.pin.vCenter().horizontally(20).height(40)
        downButton.pin.vCenter(100).hCenter(-50).sizeToFit()
        upButton.pin.vCenter(100).hCenter(50).sizeToFit()
        animationOnOffLabel.pin.vCenter(200).hCenter(-50).sizeToFit()
        animationOnOffSwitch.pin.vCenter(200).hCenter(50).sizeToFit()
    }
}