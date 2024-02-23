import Foundation

/// <#Description#>
public protocol ReuseIdentifying {

    /// The `reuseIdentifier`. If you didn't override this property, value is name of type.
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {

    static var reuseIdentifier: String {
        String(describing: self)
    }
}
