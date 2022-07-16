import UIKit

public final class TransactionListNavigator {
    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func requestNewTransactionFlow() {
        let whiteVC = UIViewController()
        whiteVC.view.backgroundColor = .white
//        navigationController.pushViewController(whiteVC, animated: true)
        navigationController.present(whiteVC, animated: true)
    }
}
