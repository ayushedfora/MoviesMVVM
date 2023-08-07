//
//  FetchMoviesListRepository.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 02/08/23.
//

import Foundation
import Alamofire

protocol FetchMovieRepositoryProtocol {
    func getMoviesList(completion: @escaping (Swift.Result<MovieData,Error>) -> Void )
}
