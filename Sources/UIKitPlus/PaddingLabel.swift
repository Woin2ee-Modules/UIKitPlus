#if canImport(UIKit)

import UIKit

public final class PaddingLabel: UILabel {

    public var padding: UIEdgeInsets {
        didSet {
            self.setNeedsDisplay()
        }
    }

    public init(padding: UIEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)) {
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
