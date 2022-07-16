import UIKit

class RootViewControllerFactory {
    func makeRootVC() -> UIViewController {
        let navigationController = UINavigationController()

        let vc = UIViewController()
        vc.view.backgroundColor = .systemIndigo

        navigationController.setViewControllers(
            [vc],
            animated: false
        )

        return navigationController
    }
}
