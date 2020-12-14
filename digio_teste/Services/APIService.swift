//
//  APIService.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 09/12/20.
//

import Foundation
import Alamofire

class ApiService {
    
//    let url = URL(string:"https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")
//
//    func getRequest() {
//        guard let requestUrl = url else { fatalError() }
//
//        var request = URLRequest(url: requestUrl)
//        request.httpMethod = "GET"
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                let json = try decoder.decode(ContentModel.self, from: data)
//                print(json)
//            } catch let error{
//                print("erro:", error)
//            }
//        }.resume()
//    }
    let decoder = JSONDecoder()
    
    private static func fetchRequest<T:Decodable>(route: ApiFactory, decoder: JSONDecoder = JSONDecoder(), completion: @escaping(Result<T, AFError>)-> Void) -> DataRequest {
        return AF.request(route).responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in completion(response.result)
        }
    }
    static func products(completion: @escaping(Result<ContentModel, AFError>)->Void) {
        fetchRequest(route: ApiFactory.products, completion: completion)
    }
    
    
}
