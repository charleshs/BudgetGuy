import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private let factory: RootViewControllerFactory = .init()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let ws = scene as? UIWindowScene else {
            return
        }

        window = UIWindow(windowScene: ws)
        window?.rootViewController = factory.makeRootVC()
        window?.makeKeyAndVisible()
    }
}
