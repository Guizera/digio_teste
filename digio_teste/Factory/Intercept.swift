//
//  Intercept.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 13/12/20.
//

import Foundation
import Alamofire

enum ApiFactory: URLRequestConvertible {
    
    case products
    
    private var method: HTTPMethod {
        switch self {
        case .products:
            return .get
        }
    }
    private var path: String {
        switch self {
        case .products:
            return "/products"
        }
    }
    private var parameters: Parameters? {
        switch self {
        case .products:
            return nil
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try Api.Url.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaders.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaders.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            }catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
    
    
}
