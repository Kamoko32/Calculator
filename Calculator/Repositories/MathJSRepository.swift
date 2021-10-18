import Foundation
import RxSwift

class MathJSRepository {
    func calculate(parameters: MathJSExpressionRequestParameter) -> Observable<MathJSExpression> {
        Endpoints.mathJS.runRequest(success: MathJSExpression.self, method: .post, parameters: parameters)
    }
}
