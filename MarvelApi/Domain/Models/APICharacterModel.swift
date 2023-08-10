//
//  APIResultModel.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 8/8/23.
//

import Foundation

struct APIResult: Codable, Equatable{
    var data: APICharacterData
}
struct APICharacterData: Codable, Equatable{
    var count: Int
    var results: [Character]
}
struct Character: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String:String]
    var urls: [[String: String]]
}
