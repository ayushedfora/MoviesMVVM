//
//  FetchMovieDetailsRepository.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 09/08/23.
//

import Foundation
import Alamofire

class FetchMovieDetailsRepository: FetchMovieDetailsRepositoryProtocol {
    private let networkService : NetworkService
    
    init(networkServiceInstance: NetworkService){
        networkService = networkServiceInstance
    }
    
    func fetchMovieDetails(movieId:Int, completion: @escaping (Result<SingleMovieData, Error>) -> Void) {
        let api_key = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MjMyMTllZmUxNDdlZWZmMmE3OGJkYWFhNWRiY2FkMCIsInN1YiI6IjY0YzdkODc1MDk3YzQ5MDBhZDAzZDk1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vG1IynYpr_60nxekR4UpEiN1QR0DaieQ3RN6VE4_338"
        let headers: HTTPHeaders = HTTPHeaders([
            "accept":"application/json",
            "Authorization":"Bearer \(api_key)"
          ])
        let url = BASE_URL + SINGLE_MOVIE_ENDPOINT
        let params : Parameters = [
            "movie_id": movieId,
        ]
        networkService.request(url: url, mathod: .get, headers: headers, params: params, encoder: .default) { (response:Result<SingleMovieData,Error> ) in
            switch response {
            case .success(let data):
                print("hello")
                // print(data)
            case .failure(let error):
                print("hello x")
               // print(error)
            }
        }
    }
    
    func addTwoNumbers(a: Int, b: Int) -> Int {
        return a + b
    }
}
