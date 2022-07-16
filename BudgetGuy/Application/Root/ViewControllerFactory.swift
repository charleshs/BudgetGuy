import UIKit

public protocol ViewControllerFactory {
    associatedtype ViewControllerType: UIViewController

    func makeViewController() -> ViewControllerType
}
