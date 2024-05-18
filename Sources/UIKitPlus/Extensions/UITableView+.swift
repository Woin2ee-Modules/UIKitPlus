#if canImport(UIKit)

import UIKit

extension UITableView {

    // MARK: Dequeue
    
    /// Returns a reusable table-view cell object for the class that conform to the `ReuseIdentifying` protocol and adds it to the table.
    ///
    /// - Parameters:
    ///   - type: The type of table-view cell which conforms to the `ReuseIdentifying` protocol.
    ///   - indexPath: The index path specifying the location of the cell. Always specify the index path provided to you by your data source object. This method uses the index path to perform additional configuration based on the cell’s position in the table view.
    ///
    /// - Returns: A reusable cell.
    public func dequeueReusableCell<Cell: UITableViewCell & ReuseIdentifying>(
        _ type: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell {
        let cell = self.dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath)

        guard let reusableCell = cell as? Cell else {
            fatalError("🛑 Failed to dequeue cell with '\(Cell.self)' type, '\(Cell.reuseIdentifier)' reuse identifier. Please check to adopt `ReuseIdentifying` protocol with your cell.")
        }

        return reusableCell
    }

    /// <#Description#>
    /// - Parameter type: <#type description#>
    /// - Returns: <#description#>
    public func dequeueReusableHeaderFooterView<HeaderFoorterView: UITableViewHeaderFooterView & ReuseIdentifying>(
        _ type: HeaderFoorterView.Type
    ) -> HeaderFoorterView {
        let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: type.reuseIdentifier)

        guard let reusableHeaderFooterView = headerFooterView as? HeaderFoorterView else {
            fatalError("Failed to dequeue header or footer view with '\(HeaderFoorterView.self)' type, '\(HeaderFoorterView.reuseIdentifier)' reuse identifier. Please check to adopt `ReuseIdentifying` protocol with your header or footer view.")
        }

        return reusableHeaderFooterView
    }

    // MARK: Register
    
    public func register<Cell: UITableViewCell & ReuseIdentifying>(_ cellClass: Cell.Type) {
        self.register(cellClass.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }

    public func register<View: UITableViewHeaderFooterView & ReuseIdentifying>(
        _ headerFooterViewClass: View.Type
    ) {
        self.register(headerFooterViewClass.self, forHeaderFooterViewReuseIdentifier: View.reuseIdentifier)
    }
}

#endif
