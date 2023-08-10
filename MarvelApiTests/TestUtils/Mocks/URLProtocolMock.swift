//
//  URLProtocolMock.swift
//  MarvelApiTests
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

final class URLProtocolMock: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func stopLoading() {}
    override func startLoading() {
        guard let handler = URLProtocolMock.requestHandler else {
            fatalError("Handler no inicializa")
        }
        do {
            //MARK: -Call the handler and send the request to check ok
            let (response, data) = try handler(request)
            
            //MARK: -Set the response to the client
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            //MARK: -Set the data to the client
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            //MARK: -Request done
            client?.urlProtocolDidFinishLoading(self)
            
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
}
