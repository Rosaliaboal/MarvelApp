//
//  RepositoryTests.swift
//  MarvelApiUITests
//
//  Created by López Aboal Rosalía on 10/8/23.
//

import XCTest
@testable import MarvelApi

final class RepositoryTests: XCTestCase {
    var sut: RepositoryProtocol?
    override func setUpWithError() throws {
        try super.setUpWithError()
        let remoteDataSourceMock = RemoteDataSourceMock(getInfo: false)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
    }
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    func testGetCharacter_whenGetData_expectCharacters() async throws {
       //MARK: -GIVEN, WHEN, THEN
        let remoteDataSourceMock = RemoteDataSourceMock(getInfo: true)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        let characters = try await sut?.getApiCharacter(searchQuery: "")
        
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters, APIResult(data: APICharacterData(count: 1, results: [Character(id: 1, name: "character1", description: "description", thumbnail: ["String" : "String"], urls: [["String" : "String"]])])))
    }
    func testGetComic_whenGetComic_expectComic() async throws {
       //MARK: -GIVEN, WHEN, THEN
        let remoteDataSourceMock = RemoteDataSourceMock(getInfo: true)
        sut = RepositoryImpl(remoteDataSource: remoteDataSourceMock)
        let comics = try await sut?.getApiComic(offset: 1)
        
        XCTAssertNotNil(comics)
        XCTAssertEqual(comics, APIComicResult(data: APIComicData(count: 2, results: [Comic(id: 2, title: "comic1", thumbnail: ["String" : "String"], urls: [["String" : "String"]])])))
    }
}
