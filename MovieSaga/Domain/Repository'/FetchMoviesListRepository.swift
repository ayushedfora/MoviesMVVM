//
//  FetchMoviesListRepository.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 02/08/23.
//

import Foundation
import Alamofire

protocol FetchMovieListRepositoryProtocol {
    func getMoviesList(completion: @escaping (Swift.Result<MovieData,Error>) -> Void )
}


