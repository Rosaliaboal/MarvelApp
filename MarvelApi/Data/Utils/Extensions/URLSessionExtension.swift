//
//  URLSessionExtension.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

extension URLSession: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws  -> (Data, URLResponse) {
        return try await data(for: url)
    }
}
