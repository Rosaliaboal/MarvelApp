//
//  RemoteDataSourceProtocolTest.swift
//  MarvelApiTests
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import XCTest
@testable import MarvelApi

// MARK: - RemoteDataSourceImpl Test
final class RemoteDataSourceProtocolTest: XCTestCase {
    var sut: RemoteDataSourceProtocol?
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RemoteDataSourceImpl()
    }
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    func testRemoteDataSource_whenGetCharactersMockUrlSession_expectCharacters() async throws{
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        URLProtocolMock.requestHandler = { request in
                    let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields:  nil)!
            let apiResult = APIResult(data: .init(count: 1, results: [.init(id: 1, name: "name1", description: "Description 1", thumbnail: ["String" : "String"], urls: [["String" : "String"]])]))
            let data = try JSONEncoder().encode(apiResult)
                    return (response, data)
                }
        guard let apiResult = try await sut?.getApiCharacter(searchQuery: "")
        else{
            XCTFail()
            return
        }
        XCTAssertNotNil(apiResult.data.results.first)
        XCTAssertEqual(apiResult.data.results.first?.name, "name1")
    }
    func testRemoteDataSource_whenGetComicsMockUrlSession_expectComics() async throws{
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        URLProtocolMock.requestHandler = { request in
                    let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields:  nil)!
            let apiComicResult = APIComicResult(data: .init(count: 1, results: [.init(id: 2, title: "hola", thumbnail: ["hola1":"hola2"], urls: [["hola1":"hola2"]])]))
            let data = try JSONEncoder().encode(apiComicResult)
                    return (response, data)
                }
        
        guard let apiComicResult = try await sut?.getApiComic(offset: 1)
        else{
            XCTFail()
            return
        }
        XCTAssertNotNil(apiComicResult.data.results.first)
        XCTAssertEqual(apiComicResult.data.results.first?.title, "hola")
    }
}
