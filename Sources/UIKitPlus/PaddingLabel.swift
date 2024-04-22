#if canImport(UIKit)

import UIKit

public final class PaddingLabel: UILabel {

    public var padding: UIEdgeInsets {
        didSet {
            self.setNeedsDisplay()
        }
    }

    public init(padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        self.padding = padding
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    public override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += (padding.left + padding.right)
        contentSize.height += (padding.top + padding.bottom)
        return contentSize
    }
}

#endif
