import UIKit
import UIKitPlus
import XCTest

final class UIKitPlusTests: XCTestCase {
    
    func test_reusableCell() {
        let tableView: UITableView = .init()
        tableView.register(TestCell.self)
        let cell = tableView.dequeueReusableCell(TestCell.self, for: .init(row: 0, section: 0))
        XCTAssertEqual(type(of: cell).reuseIdentifier, "TestCell")
    }
    
    func test_reusableHeaderFooterView() {
        let tableView: UITableView = .init()
        tableView.register(TestHeaderFooterView.self)
        let headerFooterView = tableView.dequeueReusableHeaderFooterView(TestHeaderFooterView.self)
        XCTAssertEqual(type(of: headerFooterView).reuseIdentifier, "TestHeaderFooterView")
    }
}

final class TestCell: UITableViewCell, ReuseIdentifying {}
final class TestHeaderFooterView: UITableViewHeaderFooterView, ReuseIdentifying {}
