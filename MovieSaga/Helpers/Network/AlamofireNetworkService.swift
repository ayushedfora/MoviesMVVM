//
//  NetworkService.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 03/08/23.
//

import Foundation
import Alamofire


class AlamofireNetworkService: NetworkService {
    func request<T>(url: String, mathod: Alamofire.HTTPMethod, headers: Alamofire.HTTPHeaders, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        AF.request("https://api.themoviedb.org/3/movie/popular?language=en-US&page=1",method: mathod,headers: headers).responseDecodable(of: T.self) { response in
           
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    

    
}
