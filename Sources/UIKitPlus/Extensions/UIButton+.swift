#if canImport(UIKit)

import UIKit

extension UIButton {

    /// Sets the background color to use for the specified button state.
    /// - Parameters:
    ///   - color: The background color to use for the specified state.
    ///   - state: The state that uses the specified color. The values are described in [UIControl.State.](https://developer.apple.com/documentation/uikit/uicontrol/state)
    public func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let drawingRect: CGRect = .init(origin: .zero, size: CGSize(width: 1.0, height: 1.0))
        let renderer: UIGraphicsImageRenderer = .init(size: drawingRect.size)
        let backgroundImage = renderer.image { context in
            color.setFill()
            context.fill(drawingRect)
        }

        setBackgroundImage(backgroundImage, for: state)
    }
}

#endif
