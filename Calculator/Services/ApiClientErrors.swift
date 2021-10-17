import Foundation

public enum ApiClientErrors: Error, LocalizedError {
    case noResponse
    case noData
    public var errorDescription: String {
        switch self {
        case .noResponse: return "No Response"
        case .noData: return "No Data"
        }
    }
}
