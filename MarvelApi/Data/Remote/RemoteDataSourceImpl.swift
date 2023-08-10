//
//  RemoteDataSource.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let session : NetworkFetchingProtocol
    init(session: NetworkFetchingProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getApiCharacter(searchQuery: String) async throws -> APIResult {
        guard let url = getCharacterSession(searchQuery: searchQuery) else {
            return APIResult(data: APICharacterData(count: 0, results: []))
        }
        
        let (data, _) = try await session.data(url: url)
        return try JSONDecoder().decode(APIResult.self, from: data)
    }
    
    func getApiComic(offset: Int) async throws -> APIComicResult {
        guard let url = getComicSession(offset: offset) else {
            return APIComicResult(data: APIComicData(count: 0, results: []))
        }
        
        let (data, _) = try await session.data(url: url)
        return try JSONDecoder().decode(APIComicResult.self, from: data)
    }
}
extension RemoteDataSourceImpl {
    func getCharacterSession(searchQuery: String) -> URLRequest? {
        let ts = String(Date().timeIntervalSince1970)
        
        // MARK: - Encrypt my private key
        let hash = EncryptPrivateKey.MD5(data: "\(ts)\(privateKey)\(publicKey)")
        
        // MARK: - Allow empty spaces
        let originalQuery = searchQuery.replacingOccurrences(of: " ", with: "%20")
        
        // MARK: - Form the URL
        guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(originalQuery)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)")
        else {
            print("Error")
            return nil
        }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
    func getComicSession(offset: Int) -> URLRequest? {
        let ts = String(Date().timeIntervalSince1970)
        
        // MARK: - Encrypt my private key
        let hash = EncryptPrivateKey.MD5(data: "\(ts)\(privateKey)\(publicKey)")
        // MARK: - Form the URL
        guard let url = URL(string:  "https://gateway.marvel.com:443/v1/public/comics?limit=20&offset=\(offset)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)")
        else {
            print("Error")
            return nil
        }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
}
