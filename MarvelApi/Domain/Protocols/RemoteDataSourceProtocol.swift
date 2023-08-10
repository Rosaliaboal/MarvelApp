//
//  RemoteDataSourceProtocol.swift
//  MarvelApi
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func getApiCharacter(searchQuery: String) async throws -> APIResult
    func getApiComic(offset: Int) async throws -> APIComicResult
}
