//
//  FetchMovieUseCaseProtocol.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 05/08/23.
//

import Foundation

import Foundation
import Alamofire

protocol FetchMovieUseCaseProtocol {
    func getMoviesList(completion: @escaping (Swift.Result<MovieData,Error>) -> Void )
}
