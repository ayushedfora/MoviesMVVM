//
//  FetchMoviesDetailsRepository.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 08/08/23.
//

import Foundation


protocol FetchMovieDetailsRepositoryProtocol {
    func fetchMovieDetails(movieId: Int, completion: @escaping (Swift.Result<SingleMovieData,Error>) -> Void)
    func addTwoNumbers(a:Int, b: Int) -> Int
}
