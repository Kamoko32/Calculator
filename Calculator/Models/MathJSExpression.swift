import Foundation

struct MathJSExpression: Codable {
    let result: String
}

struct MathJSExpressionRequestParameter: Codable {
    let expr: String
}
