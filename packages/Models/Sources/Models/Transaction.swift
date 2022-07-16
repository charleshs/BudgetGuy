import Foundation

public class Transaction {
    /// The timestamp that the transaction occurs at.
    public var occurrence: Date

    /// Describes the transaction.
    public var description: String

    /// The amount of money the transaction values.
    public private(set) var amount: NSDecimalNumber
    
    public private(set) var databaseMetadata: DatabaseMetadata

    public let uuidString: String

    public init(
        occurrence: Date,
        description: String,
        amount: NSDecimalNumber,
        databaseMetadata: DatabaseMetadata,
        uuidString: String = UUID().uuidString
    ) {
        self.occurrence = occurrence
        self.description = description
        self.amount = amount
        self.databaseMetadata = databaseMetadata
        self.uuidString = uuidString
    }

    public convenience init(
        amount: NSDecimalNumber,
        description: String,
        dateNow: Date = .init()
    ) {
        self.init(
            occurrence: dateNow,
            description: description,
            amount: amount,
            databaseMetadata: DatabaseMetadata(dateNow: dateNow)
        )
    }

    func updateOccurrence(to newDate: Date) throws {
        let dateNow = Date()
        if newDate > dateNow {
            throw MutateFailure.occurringInFuture
        }

        occurrence = newDate
        modified(at: dateNow)
    }

    func updateDescription(_ newDescription: String) {
        description = newDescription
        modified()
    }

    func updateAmount(to newAmount: NSDecimalNumber) throws {
        if newAmount.compare(0) == .orderedAscending {
            throw MutateFailure.negativeAmount
        }

        amount = newAmount
        modified()
    }

    private func modified(at date: Date = Date()) {
        databaseMetadata.modifiedAt = date
    }
}

extension Transaction {
    enum MutateFailure: Error {
        case negativeAmount
        case occurringInFuture
    }
}
