//
//  NetworkProtocol.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 02/08/23.
//

import Foundation
import Alamofire


protocol NetworkService {
    func request<T:Decodable> (
     url: String,
     mathod: HTTPMethod,
     headers: HTTPHeaders,
     completion: @escaping(Result<T,Error>) -> Void
    )
    
}
