import Foundation

public struct Payout {
    public var occurrence: Date {
        didSet {
            meta.lastModified = Date()
        }
    }

    public var description: String {
        didSet {
            meta.lastModified = Date()
        }
    }

    public private(set) var amount: NSDecimalNumber {
        didSet {
            meta.lastModified = Date()
        }
    }

    public private(set) var meta: Meta

    public mutating func updateAmount(
        to newAmount: NSDecimalNumber
    ) {
        amount = newAmount
    }

    public let uuidString: String
}

extension Payout {
    public struct Meta {
        public let createdAt: Date
        public var lastModified: Date
    }

    public init(
        amount: NSDecimalNumber,
        description: String,
        dateNow: Date = .init(),
        uuidString: String = UUID().uuidString
    ) {
        self.amount = amount
        self.description = description
        self.uuidString = uuidString

        occurrence = dateNow
        meta = .init(createdAt: dateNow, lastModified: dateNow)
    }
}

extension Payout: Hashable {
    public static func == (lhs: Payout, rhs: Payout) -> Bool {
        lhs.meta.createdAt == rhs.meta.createdAt &&
        lhs.uuidString == rhs.uuidString
    }

    public func hash(into hasher: inout Hasher) {
        meta.createdAt.hash(into: &hasher)
        uuidString.hash(into: &hasher)
    }
}
