//
//  NetworkService.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 03/08/23.
//

import Foundation
import Alamofire


class AlamofireNetworkService: NetworkService {
    func request<T>(url: String, mathod: Alamofire.HTTPMethod, headers: Alamofire.HTTPHeaders, params: Parameters,encoder: JSONParameterEncoder,completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        print(url)
        print(params)
        print("url hello")
        AF.request(url,method: mathod,parameters: params, headers: headers).responseDecodable(of: T.self) { response in
            print(response)
            print("HELLO response")
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    

    
}
