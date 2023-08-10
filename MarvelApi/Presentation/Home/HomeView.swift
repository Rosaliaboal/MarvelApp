//
//  Home.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 2/8/23.
//

import SwiftUI

struct Home: View {
    var body: some View {

        ZStack{
            TabView{
                // MARK: - Characters View
               CharactersView(characterViewModel: CharacterViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
                    .tabItem{
                        Image(systemName: "person.3.fill")
                        Text("Characters")
                    }
                ComicsView(comicViewModel: ComicViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
                    .tabItem{
                        Image(systemName: "books.vertical.fill")
                        Text("Comics")
                    }
            }
        }.background(Image(uiImage: UIImage(named: "AppIcon")!).ignoresSafeArea())
    }
}
