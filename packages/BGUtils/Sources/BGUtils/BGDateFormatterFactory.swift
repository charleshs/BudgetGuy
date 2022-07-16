import Foundation

public struct BGDateFormatterFactory {}

public extension BGDateFormatterFactory {
    static func verbose() -> DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .long
        df.timeStyle = .long
        return df
    }
}
