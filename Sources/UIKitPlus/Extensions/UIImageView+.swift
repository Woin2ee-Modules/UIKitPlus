#if canImport(UIKit)

import UIKit

extension UIImageView {
    
    /// A rectangle which clipping the image.
    ///
    /// This property calculates the clipping rectangle based on the intrinsic image size and the content mode of the `UIImageView`.
    /// It only applies when the content mode is set to `.scaleAspectFit`. In other content modes, or if there is no image,
    /// the property returns the bounds of the UIImageView.
    ///
    /// This property can calculate correct rectangle even if the `UIImageView`'s frame has only one of width or height.
    /// If one of width and height of the `UIImageView` is not yet determined`(value == 0)`, this property will calculate correct rantangle with the scale calculated from the other.
    public var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let scale: CGFloat
        
        if bounds.width == 0 {
            scale = bounds.height / image.size.height
        } else if bounds.height == 0 {
            scale = bounds.width / image.size.width
        } else {
            let widthScale = bounds.width / image.size.width
            let heightScale = bounds.height / image.size.height
            scale = min(widthScale, heightScale)
        }
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0
        
        return CGRect(origin: CGPoint(x: x, y: y), size: size)
    }
}

#endif
