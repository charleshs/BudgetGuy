import BGUtils
import XCTest

final class CollectionExtensionTests: XCTestCase {
    func test_safeAccessOfElements() {
        let nums: [Int] = [1, 3, 4, 6, 8, 11]

        evaluate(nums, index: -1, expectation: nil)
        nums.enumerated().forEach { offset, value in
            evaluate(nums, index: offset, expectation: value)
        }
        evaluate(nums, index: 6, expectation: nil)
    }

    func test_mutateElements() {
        var nums: [Int] = [1, 3, 4, 6, 8, 11]

        nums.mutate { num in
            if num % 2 == 0 {
                num = -1
            }
        }

        XCTAssertEqual(nums, [1, 3, -1, -1, -1, 11])
    }

    private func evaluate(_ array: [Int], index: Int, expectation: Int?) {
        XCTAssertEqual(array[at: index], expectation)
    }
}

// MARK: - Optional Collection

extension CollectionExtensionTests {
    func test_isNilOrEmpty_returnTrueForEmptyString() {
        let sut: String? = ""

        XCTAssertTrue(sut.isNilOrEmpty)
    }

    func test_isNilOrEmpty_returnFalseForNonEmptyValue() {
        let sut: String? = "foo"

        XCTAssertFalse(sut.isNilOrEmpty)
    }

    func test_isNilOrEmpty_returnTrueForNilValue() {
        let sut: String? = nil

        XCTAssertTrue(sut.isNilOrEmpty)
    }

    func test_isEmptyOrNil_returnTrueForEmptyString() {
        let sut: String? = ""

        XCTAssertTrue(sut.isEmptyOrNil)
    }

    func test_nilIfEmpty_returnNilForEmptyString() {
        let sut: String? = ""

        XCTAssertNil(sut.nilIfEmpty)
    }

    func test_nilIfEmpty_returnWrappedValueIfNotEmpty() {
        let sut: String? = "foo"

        XCTAssertEqual(sut.nilIfEmpty, "foo")
    }
}
