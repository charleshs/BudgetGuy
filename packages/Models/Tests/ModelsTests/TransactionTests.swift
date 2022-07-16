import XCTest
import Models

final class TransactionTests: XCTestCase {
    func test_init() {
        let uuid = UUID()
        let dateNow = Date()

        let sut = Transaction(
            occurrence: dateNow,
            description: "Buy something",
            amount: 100,
            databaseMetadata: DatabaseMetadata(dateNow: dateNow),
            uuidString: uuid.uuidString
        )

        XCTAssertEqual(sut.occurrence, dateNow)
        XCTAssertEqual(sut.description, "Buy something")
        XCTAssertEqual(sut.amount, 100)
        XCTAssertEqual(sut.uuidString, uuid.uuidString)
        XCTAssertEqual(sut.databaseMetadata.createdAt, dateNow)
        XCTAssertEqual(sut.databaseMetadata.modifiedAt, dateNow)
    }
}
