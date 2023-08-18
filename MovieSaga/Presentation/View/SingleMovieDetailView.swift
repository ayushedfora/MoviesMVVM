//
//  SingleMovieDetailView.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 12/08/23.
//

import SwiftUI

struct SingleMovieDetailView: View {
    var singleMovieDetailUseCase: FetchSingleMovieUseCaseProtocol
    var singleMovieDetailRepository: FetchMovieDetailsRepository
    @ObservedObject var singleMovieDetailVM : SingleMovieDetailsViewModel
    
    init() {
        let networkService = AlamofireNetworkService()
        self.singleMovieDetailRepository = FetchMovieDetailsRepository(networkServiceInstance: networkService)
        self.singleMovieDetailUseCase = FetchMovieDetails(movieRepositoryInstance: singleMovieDetailRepository)
        self.singleMovieDetailVM = SingleMovieDetailsViewModel(fetchSingleMovieUseCaseInstance:self.singleMovieDetailUseCase)
    }
    
    var body: some View {
        ZStack{
            Text(singleMovieDetailVM.singleMovieDetail?.imdbID ?? "No Id")
        }.onAppear(){
            singleMovieDetailVM.execute()
        }
        
    }
}

struct SingleMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SingleMovieDetailView()
    }
}
