import Foundation
import Alamofire
import RxSwift

public enum ComplexResponse<T, E> {
    case success(Int, T, [String: String]?)
    case failure(Int, E, [String: String]?)
}

class ApiClient {
    var path: URLConvertible

    public init(path: URLConvertible) {
        self.path = path
    }

    public final func getData<Parameters: Encodable, Success: Decodable>(success: Success.Type, method: HTTPMethod, parameters: Parameters? = nil) -> Observable<Success> {
        .create { [unowned self] observer in
            runRequest(
                method: method,
                parameters: parameters,
                encoder: JSONParameterEncoder.default,
                headers: ["Content-Type": "application/json"]
            )
                .responseJSON { response in
                    switch response.result {
                    case .success(_):
                        if let data = response.data {
                            do {
                                let output = try JSONDecoder().decode(Success.self, from: data)
                                observer.onNext(output)
                                observer.onCompleted()
                            } catch let decodeError {
                                observer.onError(decodeError)
                            }
                        } else {
                            observer.onError(ApiClientErrors.noData)
                        }
                    case .failure(_):
                        observer.onError(ApiClientErrors.noData)
                    }
                }
            return Disposables.create()
        }
    }

    private func runRequest<Parameters: Encodable>(method: HTTPMethod, parameters: Parameters? = nil, encoder: ParameterEncoder, headers: HTTPHeaders? = nil) -> DataRequest {
        AF.request(path, method: method, parameters: parameters, encoder: encoder, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json", "application/xml", "application/ld+json"])
    }
}
