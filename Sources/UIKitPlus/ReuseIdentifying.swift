#if canImport(UIKit)

import UIKit

/// A protocol that provides a type property `reuseIdentifier`.
public protocol ReuseIdentifying {

    /// The `reuseIdentifier`. If you didn't override this property, value is name of concrete type.
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {

    public static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifying {}
extension UITableViewHeaderFooterView: ReuseIdentifying {}
extension UICollectionReusableView: ReuseIdentifying {}

#endif
