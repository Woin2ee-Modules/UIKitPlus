#if canImport(UIKit)

import UIKit

extension UICollectionView {
    
    // MARK: Register
    
    public func register<Cell: UICollectionViewCell & ReuseIdentifying>(_ cellClass: Cell.Type) {
        self.register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    public func register<View: UICollectionReusableView & ReuseIdentifying>(
        _ viewClass: View.Type,
        forSupplementaryViewOfKind elementKind: String
    ) {
        self.register(
            viewClass,
            forSupplementaryViewOfKind: elementKind,
            withReuseIdentifier: viewClass.reuseIdentifier
        )
    }
    
    // MARK: Dequeue
    
    public func dequeueReusableCell<Cell: UICollectionViewCell & ReuseIdentifying>(
        _ cellClass: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath)
        
        guard let reusableCell = cell as? Cell else {
            fatalError("🛑 Failed to dequeue cell with '\(Cell.self)' type, '\(Cell.reuseIdentifier)' reuse identifier. Please check to adopt `ReuseIdentifying` protocol with your cell.")
        }

        return reusableCell
    }
    
    public func dequeueReusableSupplementaryView<View: UICollectionReusableView & ReuseIdentifying>(
        ofKind elementKind: String,
        withView viewClass: View.Type,
        for indexPath: IndexPath
    ) -> View {
        let supplementaryView = self.dequeueReusableSupplementaryView(
            ofKind: elementKind,
            withReuseIdentifier: viewClass.reuseIdentifier,
            for: indexPath
        )
        
        guard let reusableSupplementaryView = supplementaryView as? View else {
            fatalError("🛑 Failed to dequeue supplementary view with '\(View.self)' type, '\(View.reuseIdentifier)' reuse identifier. Please check to adopt `ReuseIdentifying` protocol with your supplementary view.")
        }
        
        return reusableSupplementaryView
    }
}

#endif
