//
//  HomeView.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    MovieSearchRowView(movies: [.mock, .mock, .mock, .mock, .mock, .mock])
                }
                .listStyle(.plain)
                .navigationTitle(Text("Home"))
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
