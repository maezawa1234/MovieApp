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
                        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                        .cornerRadius(5)
                        .background(Color.gray)
                } else {
                    Image(uiImage: UIImage()).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                        .cornerRadius(5)
                        .background(Color.gray)
                }
            } else {
                Image(uiImage: UIImage()).resizable()
                    .renderingMode(.original)
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                    .cornerRadius(5)
                    .background(Color.gray)
            }
            Text(viewModel.movie.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.all)
            Text(viewModel.movie.overview)
                .padding(.all)
            Divider()
            Text("リリース日")
                .foregroundColor(Color.gray)
                .padding([.leading, .top])
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(viewModel.movie.releaseDate ?? "nil")
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("対象")
                .foregroundColor(Color.gray)
                .padding([.leading, .top])
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(viewModel.movie.adult ? "成人向け" : "全年齢")
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("average")
                .foregroundColor(Color.gray)
                .padding([.leading, .top])
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(viewModel.movie.voteAverage)")
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(with: .mock))
    }
}
