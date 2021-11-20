//
//  MovieSearchRowView.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/21.
//

import SwiftUI

struct MovieSearchRowView: View {
    let movies: [Movie]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Search")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(movies) { movie in
                        NavigationLink(destination: MovieDetailView()) {
                            MovieItemView(viewModel: MovieItemViewModel(movie: movie))
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct MovieSearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchRowView(movies: [.mock])
    }
}
