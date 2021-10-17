import Foundation
import RxSwift

class MathJSRepository {
    private let client: ApiClient = .init(path: "http://api.mathjs.org/v4/")

    func calculate(parameters: MathJSExpressionRequestParameter) -> Observable<MathJSExpression> {
        client.getData(success: MathJSExpression.self, method: .post, parameters: parameters)
    }
}
