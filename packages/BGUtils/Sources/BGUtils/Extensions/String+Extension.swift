public extension String {
    /// Creates a `""` string.
    static var empty: Self {
        return ""
    }

    /// Creates a string composed of purely whitespaces with a given length.
    /// - Parameter n: length of whitespaces.
    ///
    /// - Returns: A string composed of purely whitespaces with a given length.
    ///            When `n` is a negative value, this function returns `""`.
    static func whitespaces(n: Int = 1) -> Self {
        guard n > 0 else {
            return ""
        }
        return [String](repeating: " ", count: n).joined()
    }
}
