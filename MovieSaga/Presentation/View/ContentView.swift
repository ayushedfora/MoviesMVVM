//
//  ContentView.swift
//  MovieSaga
//
//  Created by Ayush Pawar on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    var networkService = AlamofireNetworkService()
    var movieUseCase: FetchMovieUseCaseProtocol
    var movieRepository: FetchMovieListRepository
    @ObservedObject var movieViewModel : MovieListViewModel
    
    init() {
        self.movieRepository = FetchMovieListRepository(networkService: networkService)
        self.movieUseCase = FetchMovieUseCase(movieRepository: self.movieRepository)
        self.movieViewModel = MovieListViewModel(fetchMovieUseCase: self.movieUseCase)
        
    }
    var body: some View {
        ZStack {
            LinearGradient(colors:[.white,.white], startPoint: .topLeading, endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
            NavigationStack{
            List(movieViewModel.moviesList?.results ?? [],id:\.id) { movie in
                
                HStack(alignment: .top, spacing: 20){
                    VStack(alignment: .leading){
                        Text(movie.originalTitle).font(.title3).lineLimit(1)
                        Label {
                            Text("\(movie.voteAverage)")
                        } icon: {
                            Image(systemName: "star.fill").renderingMode(.template).foregroundColor(.yellow)
                        }
                        
                        
                    }.foregroundColor(.black)
                    AsyncImage(url: URL(string: movie.posterPath)).frame(width: 50, height: 50).frame(maxWidth: .infinity, alignment: .trailing)
                }
            }.navigationDestination(for: SingleMovieData.self) { singleMovieData in
               SingleMovieDetailView()
            }
        }
        }
        .padding()
        .onAppear(){
            movieViewModel.execute()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Double {
   func truncate(places : Int)-> Double {
       return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
   }
 }
