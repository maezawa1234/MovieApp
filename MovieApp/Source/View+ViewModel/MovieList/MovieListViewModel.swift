//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation
import Combine
import SwiftUI

final class MovieListViewModel: ObservableObject {
    
    // MARK: - Inputs
    var searchBarText: String = ""
    let searchButtonClickedInput = PassthroughSubject<Void, Never>()
    
    // MARK: - Outputs
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var errorMessage: String? = nil
    @Published private(set) var isLoasing = false
    
    // DisposeBag的なやつ
    private var cancellables = Set<AnyCancellable>()
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        let searchEvent = searchButtonClickedInput
            .map { [unowned self] in self.searchBarText }
            .filter { !$0.isEmpty }
            .removeDuplicates()
//
//        searchEvent
//            .sink(receiveValue: {
//                print("searchEvent: ", $0)
//            })
//            .store(in: &cancellables)
        
        let apiResponse = searchEvent
            .flatMap {
                return movieRepository.searchMovies(query: $0)
            }
            .share()
        
        apiResponse
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    ()
                }
            }, receiveValue: { response in
                print(response)
            })
            .store(in: &cancellables)
    }
}
