import Foundation

public class Payout: Transaction {
    
}

extension Payout: Hashable {
    public static func == (lhs: Payout, rhs: Payout) -> Bool {
        lhs.uuidString == rhs.uuidString
    }

    public func hash(into hasher: inout Hasher) {
        uuidString.hash(into: &hasher)
    }
}
