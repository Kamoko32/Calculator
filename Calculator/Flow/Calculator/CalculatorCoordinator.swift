import UIKit

class CalculatorCoordinator: Coordinator {
    private let navigationController = UINavigationController()

    override init() {
        super.init()
        rootViewController = navigationController
    }

    override func start() {
        let inputScreen = R.storyboard.input.inputViewController()!
        inputScreen.viewModel.coordinator = self
        navigationController.viewControllers = [inputScreen]
    }

    func presentResultScreen(expression: Expression) {
        let resultScreen = R.storyboard.result.resultViewController()!
        resultScreen.viewModel.coordinator = self
        resultScreen.viewModel.calculate(expression: expression)
        rootViewController.present(resultScreen, animated: true, completion: nil)
    }

    func closeResultScreen() {
        guard let presentedViewController = rootViewController.presentedViewController as? ResultViewController else { return }
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
