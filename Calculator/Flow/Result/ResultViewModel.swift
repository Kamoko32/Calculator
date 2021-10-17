import Foundation
import RxCocoa
import RxSwift

class ResultViewModel: ViewModel<CalculatorCoordinator> {
    let result = BehaviorRelay<String>(value: "")
    let isDownloading = BehaviorRelay<Bool>(value: true)

    private let client = MathJSRepository()

    func calculate(expression: Expression) {
        isDownloading.accept(true)
        client.calculate(parameters: .init(expr: expression.getExpression())).subscribe { [weak self] event in
            guard let strongSelf = self else { return }
            strongSelf.isDownloading.accept(false)
            switch event {
            case .next(let result):
                strongSelf.result.accept(result.result)
            case .error(let error):
                print(error)
            case .completed: break
            }
        }.disposed(by: bag)
    }
}
