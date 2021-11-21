//
//  SearchMovieView.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import SwiftUI

struct SearchMovieView: View {

    @ObservedObject var viewModel: SearchMovieViewModel

    var body: some View {
        NavigationView {

            VStack {

                HStack {
                    TextField("Search movies...", text: $viewModel.searchBarText)
                        .frame(height: 40)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .border(Color.gray, width: 1)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
 
                    Button<Text>(LocalizedStringKey("Search")) { self.viewModel.searchButtonClickedInput.send(()) }
                        .frame(height: 40)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .border(Color.blue, width: 1)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                }

                List {
                    ForEach(viewModel.movies) { movie in
                        
                        NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(with: movie))) {
                            SearchMovieCellView(viewModel: SearchMovieCellViewModel(with: movie))
                        }
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle(Text("Search Movie 🔍"))
            }
            
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieView(viewModel: SearchMovieViewModel())
    }
}
