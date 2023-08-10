//
//  CharacterRowView.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CharacterRowView: View {
    var character: Character
    var body: some View{
        HStack(alignment: .top, spacing: 15){
            WebImage(url: ExtractInfo.extractImage(data: character.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 8, content: {
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(character.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                
                // MARK: - Links
                HStack(spacing: 10){
                    ForEach(character.urls,id: \.self){data in
                        NavigationLink(
                            destination: WebView(url: ExtractInfo.extractURL(data: data)).navigationTitle(ExtractInfo.extractURLType(data: data)),
                            label: {
                                Text(ExtractInfo.extractURLType(data: data)) })
                    }
                }
            })
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }
}
