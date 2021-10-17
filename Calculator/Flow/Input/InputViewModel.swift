import Foundation
import RxSwift
import RxCocoa

class InputViewModel: ViewModel<CalculatorCoordinator> {
    enum Operation: Int {
        case addition
        case subtraction
        case multiplication
        case division

        fileprivate var sign: String {
            switch self {
                case .addition: return "+"
                case .subtraction: return "-"
                case .multiplication: return "*"
                case .division: return "/"
            }
        }
    }

    let calculate = PublishRelay<Void>()
    let stepperValue = BehaviorRelay<Int>(value: 0)
    let sliderValue = BehaviorRelay<Int>(value: 0)
    let operation = BehaviorRelay<Operation>(value: .addition)

    let isCalculateButtonEnabled = BehaviorRelay<Bool>(value: false)

    override func setupBindings() {
        let expression = Observable.combineLatest(stepperValue, sliderValue, operation)
            .map { stepper, slider, operation -> Expression in
            .init(firstValue: stepper, operationSign: operation.sign, secondValue: slider)
            }

        Observable.combineLatest(operation, sliderValue)
            .map { operation, value in
                !(operation == .division && value == 0)
            }
            .bind(to: isCalculateButtonEnabled)
            .disposed(by: bag)

        calculate
            .withLatestFrom(expression)
            .subscribe(onNext: { [unowned self] in
                coordinator?.presentResultScreen(expression: $0)
            }).disposed(by: bag)
    }
}
