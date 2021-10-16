import Foundation
import RxSwift
import RxCocoa

class InputViewModel: ViewModel<CalculatorCoordinator> {
    enum Operation: Int {
        case addition
        case subtraction
        case multiplication
        case division

        fileprivate var operationSign: String {
            switch self {
                case .addition: return "+"
                case .subtraction: return "-"
                case .multiplication: return "*"
                case .division: return "/"
            }
        }
    }

    let stepperValue = BehaviorRelay<Int>(value: 0)
    let sliderValue = BehaviorRelay<Int>(value: 0)
    let operation = BehaviorRelay<Operation>(value: .addition)

    let isCalculateButtonEnabled = BehaviorRelay<Bool>(value: false)

    override func setupBindings() {
        Observable.combineLatest(operation, sliderValue)
            .map { operation, value in
                !(operation == .division && value == 0)
            }
            .bind(to: isCalculateButtonEnabled)
            .disposed(by: bag)
    }
}
