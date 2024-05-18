import UIKit
import UIKitPlus
import XCTest

final class ReuseIdentifyingTests: XCTestCase {

    func test_reusableCell() {
        let tableView: UITableView = .init()
        tableView.register(TestTableViewCell.self)
        let cell = tableView.dequeueReusableCell(TestTableViewCell.self, for: .init(row: 0, section: 0))
        XCTAssertEqual(type(of: cell).reuseIdentifier, "TestTableViewCell")
    }
    
    func test_reusableHeaderFooterView() {
        let tableView: UITableView = .init()
        tableView.register(TestHeaderFooterView.self)
        let headerFooterView = tableView.dequeueReusableHeaderFooterView(TestHeaderFooterView.self)
        XCTAssertEqual(type(of: headerFooterView).reuseIdentifier, "TestHeaderFooterView")
    }
    
    func test_reusableCollectionViewCell() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(TestCollectionViewCell.self)
        
        let cell = collectionView.dequeueReusableCell(TestCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertEqual(type(of: cell).reuseIdentifier, "TestCollectionViewCell")
    }
    
    func test_reusableSupplementaryView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(TestSupplementaryView.self, forSupplementaryViewOfKind: "CustomSupplementaryView")
        collectionView.insertSections(IndexSet([]))
        
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: "CustomSupplementaryView", withView: TestSupplementaryView.self, for: IndexPath(row: 0, section: 0))
        XCTAssertEqual(type(of: supplementaryView).reuseIdentifier, "TestSupplementaryView")
    }
}

fileprivate final class TestTableViewCell: UITableViewCell {}
fileprivate final class TestHeaderFooterView: UITableViewHeaderFooterView {}
fileprivate final class TestCollectionViewCell: UICollectionViewCell {}
fileprivate final class TestSupplementaryView: UICollectionReusableView {}
