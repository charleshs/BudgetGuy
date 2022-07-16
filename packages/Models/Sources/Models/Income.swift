import Foundation

public class Income: Transaction {

}

extension Income: Hashable {
    public static func == (lhs: Income, rhs: Income) -> Bool {
        lhs.uuidString == rhs.uuidString
    }

    public func hash(into hasher: inout Hasher) {
        uuidString.hash(into: &hasher)
    }
}
