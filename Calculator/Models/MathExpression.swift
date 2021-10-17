import Foundation

struct Expression {
    let firstValue: Int
    let operationSign: String
    let secondValue: Int

    func getExpression() -> String {
        "\(firstValue)" + operationSign + "\(secondValue)"
    }
}
