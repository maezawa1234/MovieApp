//
//  SearchMovieCellView.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/21.
//

import SwiftUI

struct SearchMovieCellView: View {
    @ObservedObject var viewModel: SearchMovieCellViewModel
    
    var body: some View {
        HStack {
            if let imageData = self.viewModel.downloadData {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                        .background(Color.yellow)
                } else {
                    Image(uiImage: UIImage()).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                        .background(Color.yellow)
                }
            } else {
                Image(uiImage: UIImage()).resizable()
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(5)
                    .background(Color.yellow)
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.title3)
                HStack {
                    Text(viewModel.releaseDate)
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text(viewModel.popularity)
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
        }
    }
}

struct SearchMovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieCellView(viewModel: SearchMovieCellViewModel(with: .mock))
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
