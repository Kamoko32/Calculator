import Foundation
import RxCocoa
import RxSwift

class ResultViewModel: ViewModel<CalculatorCoordinator> {
    let result = BehaviorRelay<String>(value: "")
    let isDownloading = BehaviorRelay<Bool>(value: true)

    private let client = Client()

    func calculate(expression: Expression) {
        isDownloading.accept(true)
        client.mathJS.calculate(parameters: .init(expr: expression.getExpression())).subscribe { [weak self] event in
            guard let strongSelf = self else { return }
            strongSelf.isDownloading.accept(false)
            switch event {
            case .next(let result):
                strongSelf.result.accept(result.result)
            case .error(_):
                strongSelf.coordinator?.closeResultScreen()
            case .completed: break
            }
        }.disposed(by: bag)
    }
}
