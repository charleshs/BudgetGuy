import Foundation

public struct BGDateFormatterFactory {}

public extension BGDateFormatterFactory {
    static func dateOnly(dateStyle: DateFormatter.Style = .medium) -> DateFormatter {
        let df = DateFormatter()
        df.timeStyle = .none
        df.dateStyle = dateStyle
        return df
    }

    static func detailed() -> DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .medium
        return df
    }
}
