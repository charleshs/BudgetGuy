import Foundation

public struct DatabaseMetadata {
    public let createdAt: Date
    public var modifiedAt: Date
}

public extension DatabaseMetadata {
    init(dateNow: Date = Date()) {
        self.init(createdAt: dateNow, modifiedAt: dateNow)
    }
}
