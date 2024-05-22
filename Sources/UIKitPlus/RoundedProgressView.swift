#if canImport(UIKit)

import UIKit

open class RoundedProgressView: UIView {
    
    // MARK: Public
    
    /// A max progress.
    public var max: Int {
        get { _max }
        set {
            var newValue = newValue
            newValue = Swift.max(newValue, 0)
            _max = newValue
        }
    }
    
    /// A current progress. It is greater than 0 and less than max.
    public var progress: Int {
        get { _progress }
        set {
            var newValue = newValue
            newValue = Swift.max(newValue, 0)
            newValue = Swift.min(newValue, max)
            _progress = newValue
        }
    }
    
    /// A ratio represented current progress as 0 to 1 value. 1 means the max.
    public var progressRatio: CGFloat {
        guard max != 0 else { return 0 }
        
        var ratio = CGFloat(progress) / CGFloat(max)
        ratio = Swift.max(ratio, 0)
        ratio = Swift.min(ratio, 1)
        return ratio
    }
    
    public var progressBarColor: UIColor = .systemBlue {
        willSet {
            progressView.backgroundColor = newValue
        }
    }
    
    public var progressBarInset: CGFloat = 3 {
        willSet {
            setNeedsLayout()
        }
    }
    
    // MARK: Private
    
    private let progressView = UIView()
    
    private var _max: Int = 0 {
        willSet {
            setNeedsLayout()
        }
    }
    
    private var _progress: Int = 0 {
        willSet {
            setNeedsLayout()
        }
    }
    
    public init(max: Int) {
        self._max = max
        super.init(frame: .zero)
        self.addSubview(progressView)
    }
    
    public convenience init() {
        self.init(max: 0)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.height / 2
        
        progressView.frame = CGRect(
            x: 0,
            y: 0,
            width: bounds.width * progressRatio,
            height: bounds.height
        ).insetBy(dx: progressBarInset, dy: progressBarInset)
        
        progressView.layer.cornerRadius = progressView.bounds.height / 2
    }
}

#endif
