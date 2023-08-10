//
//  CharacterView.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 9/8/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CharactersView: View {
    @ObservedObject var characterViewModel: CharacterViewModel
    var body: some View {
        
        // MARK: - Navigation View
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15){
        // MARK: - Searchbar
                    HStack(spacing: 10){
                        Image(systemName: "magnifiyingglass")
                            .foregroundColor(.gray)
                        TextField("Search Character", text: $characterViewModel.searchQuery)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
            // MARK: - Shadows
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                }
                .padding()
                if let characters = characterViewModel.fetchedCharacters{
                    if characters.isEmpty{
                // MARK: - If results not found
                        Text("No results found")
                            .padding(.top,20)
                    }
                    else{
                // MARK: - Show results
                        ForEach(characters){data in
                           CharacterRowView(character: data)
                        }
                    }
                }
                else {
                    if characterViewModel.searchQuery != ""{
                // MARK: - Loading screen
                        ProgressView()
                            .padding(.top,20)
                    }
                }
            })
            .navigationTitle("Marvel")
        }
    }
}
struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
