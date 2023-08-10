//
//  RepositoryImpl.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

final class RepositoryImpl: RepositoryProtocol{
    
    private let remoteDataSource : RemoteDataSourceProtocol
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    func getApiCharacter(searchQuery: String) async throws -> APIResult {
        return try await remoteDataSource.getApiCharacter(searchQuery: searchQuery)
    }
    func getApiComic(offset: Int) async throws -> APIComicResult {
        return try await remoteDataSource.getApiComic(offset: offset)
    }
}
