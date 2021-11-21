//
//  MovieItemView.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/21.
//

import SwiftUI

struct MovieItemView: View {
    
    // MARK: - Property
    @ObservedObject var viewModel: MovieItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let imageData = self.viewModel.downloadData {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                } else {
                    Image(uiImage: UIImage()).resizable()
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                }
            } else {
                Image(uiImage: UIImage()).resizable()
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(5)
            }
            Text(viewModel.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(viewModel: MovieItemViewModel(movie: .mock))
    }
}
