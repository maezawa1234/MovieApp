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
                        .background(Color.gray)
                } else {
                    Image(uiImage: UIImage()).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                        .background(Color.gray)
                }
            } else {
                Image(uiImage: UIImage()).resizable()
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(5)
                    .background(Color.gray)
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.title3)
                HStack {
                    Text(viewModel.releaseDate)
                        .foregroundColor(Color.gray)
                    Text(viewModel.originalLanguage)
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
        }
    }
}

struct SearchMovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieCellView(viewModel: SearchMovieCellViewModel(with: .mock))
            .previewLayout(.fixed(width: 500, height: 150))
    }
}
