//
//  FetchMoviesDetailsRepository.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 08/08/23.
//

import Foundation


protocol FetchMovieDetailsRepositoryProtocol {
    func fetchMovieDetails(completion: @escaping (Swift.Result<MovieData,Error>) -> Void)
    func addTwoNumbers(a:Int, b: Int) -> Int
}
