//
//  FetchMovieDetailsUseCase.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 09/08/23.
//

import Foundation

class FetchMovieDetails: FetchSingleMovieUseCaseProtocol {
    var movieRepository: FetchMovieDetailsRepositoryProtocol
    
    init(movieRepositoryInstance: FetchMovieDetailsRepositoryProtocol){
        self.movieRepository = movieRepositoryInstance
    }
    
    func fetchSingleMovieDetails(completion: @escaping (Result<MovieData, Error>) -> Void) {
        movieRepository.fetchMovieDetails { (result: Result<MovieData,Error>) in
            switch result {
            case .success(let movieData):
                completion(.success(movieData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
