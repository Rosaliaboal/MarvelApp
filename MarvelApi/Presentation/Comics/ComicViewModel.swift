//
//  ComicViewModel.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

final class ComicViewModel: ObservableObject, ComicViewModelProtocol {
    let repository: RepositoryProtocol
    
    // MARK: - Comic View Data
    @Published var fetchedComics: [Comic] = []
    @Published var offset: Int = 0
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    func fetchComics(){
        DispatchQueue.main.async {
            Task {
                guard let comicsFromApi = try? await self.repository.getApiComic(offset: self.offset) else {
                    print("Unable to get information")
                    return
                }
                self.fetchedComics = comicsFromApi.data.results
            }
        }
    }
}
