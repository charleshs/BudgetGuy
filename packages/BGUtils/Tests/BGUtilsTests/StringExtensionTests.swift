import BGUtils
import XCTest

final class StringExtensionTests: XCTestCase {
    func test_empty() {
        XCTAssertEqual(String.empty, "")
    }

    func test_whitespaces() {
        XCTAssertEqual(String.whitespaces(), " ")
        XCTAssertEqual(String.whitespaces(n: 0), "")
        XCTAssertEqual(String.whitespaces(n: 5), "     ")
        XCTAssertEqual(String.whitespaces(n: Int.min), "")
    }
}
