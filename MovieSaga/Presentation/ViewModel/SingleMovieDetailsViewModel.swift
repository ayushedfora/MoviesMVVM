//
//  SingleMovieDetailsViewModel.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 09/08/23.
//

import Foundation


class SingleMovieDetails: ObservableObject {
    @Published var singleMovieDetail: String = ""
    
    var fetchSingleMovieUseCase: FetchSingleMovieUseCaseProtocol
    
    init(fetchSingleMovieUseCaseInstance: FetchSingleMovieUseCaseProtocol) {
        self.fetchSingleMovieUseCase = fetchSingleMovieUseCaseInstance
    }
    
    func execute() {
        fetchSingleMovieUseCase.fetchSingleMovieDetails { [weak self] (result: Swift.Result<MovieData,Error>) in
            switch result {
            case .success(let data):
                self?.singleMovieDetail = data.results[0].title
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
