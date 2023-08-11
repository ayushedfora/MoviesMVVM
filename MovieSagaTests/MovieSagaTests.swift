//
//  MovieSagaTests.swift
//  MovieSagaTests
//
//  Created by Ayush Pawar on 10/08/23.
//

import XCTest

@testable import MovieSaga

final class MovieSagaTests: XCTestCase {
    var networkService: NetworkService!
    var movieDetailsRepo: FetchMovieDetailsRepositoryProtocol!

    override func setUpWithError() throws {
        networkService = AlamofireNetworkService()
        movieDetailsRepo = FetchMovieDetailsRepository(networkServiceInstance: networkService)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let result = movieDetailsRepo.addTwoNumbers(a: 3, b: 5)
        XCTAssertEqual(result, 8)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
