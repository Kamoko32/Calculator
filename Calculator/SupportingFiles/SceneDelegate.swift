import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var calculatorCoordinator: CalculatorCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        calculatorCoordinator = CalculatorCoordinator()
        calculatorCoordinator?.start()
        window?.rootViewController = calculatorCoordinator?.rootViewController
        window?.makeKeyAndVisible()
    }
}
