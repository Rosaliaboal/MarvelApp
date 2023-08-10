//
//  NetworkFetchingProtocol.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
