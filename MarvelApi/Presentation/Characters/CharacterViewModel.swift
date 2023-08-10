//
//  CharacterViewModel.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation
import Combine

final class CharacterViewModel: ObservableObject, CharacterViewModelProtocol{
    @Published var searchQuery = ""
    let repository: RepositoryProtocol
    
    // MARK: - Search bar, cancel wwhen needed
    var searchCancellable: AnyCancellable? = nil
    @Published var fetchedCharacters: [Character]? = nil
    init(repository: RepositoryProtocol) {
        self.repository = repository
        searchCancellable = $searchQuery
        
        // MARK: - Delete duplicates
            .removeDuplicates()
        
        // MARK: - Wait 0.6 since stopped typing
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str == ""{
                    // reset Data
                    self.fetchedCharacters = nil
                }
                else {
                    // search Data
                    self.searchCharacter()
                }
            })
    }
    func searchCharacter(){
        DispatchQueue.main.async {
            Task {
                guard let charactersFromApi = try? await self.repository.getApiCharacter(searchQuery: self.searchQuery) else {
                    print("Unable to get information")
                    return
                }
                self.fetchedCharacters = charactersFromApi.data.results
            }
        }
    }
}
