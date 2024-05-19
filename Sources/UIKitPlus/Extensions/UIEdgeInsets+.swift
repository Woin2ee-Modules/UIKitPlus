#if canImport(UIKit)

import UIKit

extension UIEdgeInsets {
    
    /// The vertical edge inset value. It is the same as `top + bottom`.
    public var vertical: CGFloat {
        self.top + self.bottom
    }
    
    /// The horizontal edge inset value. It is the same as `left + right`.
    public var horizontal: CGFloat {
        self.left + self.right
    }
}

#endif
