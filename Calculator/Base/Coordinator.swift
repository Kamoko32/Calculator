import UIKit

class Coordinator: CoordinatorType {
    public var rootViewController: UIViewController = UIViewController()
    public var childCoordinators: [CoordinatorType] = []

    public init() { }
    public func start() { }
}
