//
//  RemoteDataSourceMock.swift
//  MarvelApiTests
//
//  Created by López Aboal Rosalía on 10/8/23.
//

import Foundation
import Combine
@testable import MarvelApi

final class RemoteDataSourceMock: RemoteDataSourceProtocol {
    var getInfo: Bool
    var apiCharacter: APIResult = APIResult(data: APICharacterData(count: 1, results: [Character(id: 1, name: "character1", description: "description", thumbnail: ["String" : "String"], urls: [["String" : "String"]])]))
    var apiComic: APIComicResult = APIComicResult(data: APIComicData(count: 2, results: [Comic(id: 2, title: "comic1", thumbnail: ["String" : "String"], urls: [["String" : "String"]])]))
    init(getInfo: Bool) {
        self.getInfo = getInfo
    }
    func getApiCharacter(searchQuery: String) async throws -> MarvelApi.APIResult {
        switch getInfo {
        case true: return apiCharacter
        case false : return APIResult(data: APICharacterData(count: 0, results: [Character(id: 1, name: "Error", description: "Error", thumbnail: ["Error" : "Error"], urls: [["Error" : "Error"]])]))
        }
    }
    func getApiComic(offset: Int) async throws -> MarvelApi.APIComicResult {
        switch getInfo {
        case true: return apiComic
        case false : return APIComicResult(data: APIComicData(count: 3, results: [Comic(id: 0, title: "error", thumbnail: ["error" : "error"], urls: [["error" : "error"]])]))
        }
    }
}
