//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation
import Combine
import SwiftUI
import APIKit

final class MovieListViewModel: ObservableObject {
    
    // MARK: - Inputs
    var searchBarText: String = ""
    let searchButtonClickedInput = PassthroughSubject<Void, Never>()
    
    // MARK: - Outputs
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var errorMessage: String? = nil
    @Published private(set) var isLoasing = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        let searchEvent = searchButtonClickedInput
            .map { [unowned self] in self.searchBarText }
            .filter { !$0.isEmpty }
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
        
        let apiResponse = searchEvent
            .flatMap {
                return movieRepository.searchMovies(query: $0)
            }
            .share()
        
        apiResponse
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finished")
                    self.isLoasing = false
                case .failure(let error):
                    print("failure")
                    print(error.localizedDescription)
                    self.isLoasing = false
                }
            }, receiveValue: { response in
                print(response)
                self.movies = response.results
            })
            .store(in: &cancellables)
    }
}
