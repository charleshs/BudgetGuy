import Foundation

public protocol ModelPopulated {
    associatedtype Model

    func populate(with model: Model)
}
