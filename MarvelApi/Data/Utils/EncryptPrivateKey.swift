//
//  EncryptPrivateKey.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 8/8/23.
//

// import CryptoKit to generate the hash
import Foundation
import CryptoKit


final class EncryptPrivateKey {
    
    // MARK: - cryptographic function
    static func MD5(data: String)->String{
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map{
            String(format: "%02hhx", $0)
        }
        .joined()
    }
}
