import UIKit

class RootViewControllerFactory {
    func makeRootVC() -> UIViewController {
        let navigationController = UINavigationController()

        let txnListFactory = TransactionListFactory(makeNavigator: {
            TransactionListNavigator(navigationController: navigationController)
        })
        let txnListVC = txnListFactory.makeViewController()

        navigationController.setViewControllers(
            [txnListVC],
            animated: false
        )

        return navigationController
    }
}

class TransactionListFactory: ViewControllerFactory {
    private let makeNavigator: () -> TransactionListNavigator

    init(makeNavigator: @escaping () -> TransactionListNavigator) {
        self.makeNavigator = makeNavigator
    }

    func makeViewController() -> TransactionListViewController {
        let viewModel = TransactionListViewModel(
            navigator: makeNavigator()
        )
        let viewController = TransactionListViewController(
            presenter: viewModel,
            interactor: viewModel
        )
        return viewController
    }
}
