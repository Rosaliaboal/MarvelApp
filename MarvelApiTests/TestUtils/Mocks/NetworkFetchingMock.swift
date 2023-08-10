//
//  NetworkFetchingMock.swift
//  MarvelApiTests
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation
import Combine
@testable import MarvelApi

class NetworkFetchingMock: NetworkFetchingProtocol {
    let result: Result<Data, Error>
    init(returning result: Result<Data, Error>) {
        self.result = result
    }
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return ("".data(using: .utf8)!,URLResponse())
    }
}
