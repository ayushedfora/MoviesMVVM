//
//  FetchMovieUseCase.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 05/08/23.
//

import Foundation


class FetchMovieUseCase: FetchMovieUseCaseProtocol {
    var movieApiService: FetchMovieRepositoryProtocol
    
    init(movieRepository: FetchMovieRepositoryProtocol){
        self.movieApiService = movieRepository
    }
    
    func getMoviesList(completion: @escaping (Result<MovieData, Error>) -> Void) {
        movieApiService.getMoviesList {( result: Result<MovieData,Error> )in
            switch result{
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    
}
