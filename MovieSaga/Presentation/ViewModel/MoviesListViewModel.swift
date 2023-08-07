//
//  MoviesListViewModel.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 01/08/23.
//

import Foundation
import Alamofire


class MovieListViewModel: ObservableObject {
    @Published var moviesList: MovieData?
    var fetchMovieUseCase: FetchMovieUseCaseProtocol
    
    init(fetchMovieUseCase: FetchMovieUseCaseProtocol) {
        self.fetchMovieUseCase = fetchMovieUseCase
    }
    
    func execute(){
        fetchMovieUseCase.getMoviesList { [weak self] result in
         
            switch result{
            case .success(let data):
                self?.moviesList = data
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
