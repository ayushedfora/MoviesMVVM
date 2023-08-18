//
//  FetchSingleMovieUseCaseProtocol.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 09/08/23.
//

import Foundation

protocol FetchSingleMovieUseCaseProtocol {
    func fetchSingleMovieDetails(movieId: Int, completion: @escaping (Swift.Result<SingleMovieData,Error>)->Void)
}
