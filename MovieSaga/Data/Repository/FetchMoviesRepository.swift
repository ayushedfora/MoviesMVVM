//
//  FetchMovieListUseCase.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 02/08/23.
//

import Foundation
import Alamofire


final class FetchMovieListRepository: FetchMovieListRepositoryProtocol{
    func addTwo() {
        
    }
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    func getMoviesList(completion: @escaping (Swift.Result<MovieData, Error>) -> Void) {
        let api_key = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MjMyMTllZmUxNDdlZWZmMmE3OGJkYWFhNWRiY2FkMCIsInN1YiI6IjY0YzdkODc1MDk3YzQ5MDBhZDAzZDk1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vG1IynYpr_60nxekR4UpEiN1QR0DaieQ3RN6VE4_338"
        let headers: HTTPHeaders = HTTPHeaders([
            "accept":"application/json",
            "Authorization":"Bearer \(api_key)"
          ])
        let url = BASE_URL + MOVIE_LIST_ENDPOINT
        

        networkService.request(url: url, mathod: .get, headers: headers) { (result: Result<MovieData,Error>) in
          
            switch result {
                
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
       
    }
    
}
