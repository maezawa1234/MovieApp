//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/17.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let imageData = self.viewModel.downloadData {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                        .cornerRadius(5)
                        .background(Color.yellow)
                } else {
                    Image(uiImage: UIImage()).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                        .cornerRadius(5)
                        .background(Color.yellow)
                }
            } else {
                Image(uiImage: UIImage()).resizable()
                    .renderingMode(.original)
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                    .cornerRadius(5)
                    .background(Color.yellow)
            }
            Text(viewModel.movie.title)
            Text(viewModel.movie.releaseDate ?? "nil")
            Text(viewModel.movie.overview)
            Text(viewModel.movie.adult ? "成人向け" : "成人向けではない")
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(with: .mock))
    }
}
