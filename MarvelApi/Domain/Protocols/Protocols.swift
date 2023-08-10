//
//  Protocols.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 8/8/23.
//

import Foundation

// MARK: - Protocolos Character and Comic View Model

protocol CharacterViewModelProtocol {
    var searchQuery: String{
        get}
    var fetchedCharacters: [Character]? {
        get}
    func searchCharacter()
}
protocol ComicViewModelProtocol {
    var fetchedComics: [Comic] {
        get}
    var offset: Int {
        get}
    func fetchComics()
}
