//
//  ExtractInfo.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation

final class ExtractInfo{
    static func extractImage(data: [String: String])->URL{
        
        // MARK: - Use both and form image
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }
    static func extractURL(data: [String:String])->URL{
        let url = data["url"] ?? ""
        return URL(string: url)!
    }
    static func extractURLType(data: [String:String])->String{
        let type = data["type"] ?? ""
        return type.capitalized
    }
}
