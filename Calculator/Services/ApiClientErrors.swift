import Foundation

public enum ApiClientErrors: Error, LocalizedError {
    case noResponse
    case noData
    case noConnection
    public var errorDescription: String {
        switch self {
        case .noResponse: return "No Response"
        case .noData: return "No Data"
        case .noConnection: return "No Connection"
        }
    }
}
