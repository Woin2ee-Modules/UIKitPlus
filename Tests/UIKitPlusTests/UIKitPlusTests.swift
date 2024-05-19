import XCTest

final class UIKitPlusTests: XCTestCase {
    
    func test_UIEdgeInsets_vertical_horizontal() {
        let insets = UIEdgeInsets(top: 2, left: 3, bottom: 7, right: 11)
        XCTAssertEqual(insets.vertical, 9)
        XCTAssertEqual(insets.horizontal, 14)
    }
}
