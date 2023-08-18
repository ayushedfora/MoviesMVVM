//
//  SingleMovieDetailsViewModel.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 09/08/23.
//

import Foundation


class SingleMovieDetailsViewModel: ObservableObject {
    @Published var singleMovieDetail: SingleMovieData?
    
    var fetchSingleMovieUseCase: FetchSingleMovieUseCaseProtocol
    
    init(fetchSingleMovieUseCaseInstance: FetchSingleMovieUseCaseProtocol) {
        self.fetchSingleMovieUseCase = fetchSingleMovieUseCaseInstance
    }
    
    func execute() {
        fetchSingleMovieUseCase.fetchSingleMovieDetails(movieId: 569094) { [weak self] (result: Swift.Result<SingleMovieData,Error>) in
            switch result {
            case .success(let data):
                self?.singleMovieDetail = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
