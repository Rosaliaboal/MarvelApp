//
//  APIComicModel.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 8/8/23.
//

import Foundation

struct APIComicResult: Codable, Equatable{
    var data: APIComicData
}
struct APIComicData: Codable, Equatable{
    var count: Int
    var results: [Comic]
}
struct Comic: Identifiable, Codable, Equatable {
    var id: Int
    var title: String
    var description: String?
    var thumbnail: [String:String]
    var urls: [[String: String]]
}
