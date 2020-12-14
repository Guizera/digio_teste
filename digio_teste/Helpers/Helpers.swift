//
//  Helpers.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 13/12/20.
//

import Foundation

struct Api {
    struct Url {
        static let baseUrl = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox"
    }
}
enum HTTPHeaders: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
enum ContentType: String {
    case json = "application/json"
}
