//
//  ComicsView.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 4/8/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicsView: View {
    @ObservedObject var comicViewModel: ComicViewModel
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false,
                       content: {
                if comicViewModel.fetchedComics.isEmpty{
                    ProgressView()
                        .padding(.top,30)
                }
                else{
                    VStack(spacing: 15){
                        ForEach(comicViewModel.fetchedComics){comic in
                            ComicRowView(character: comic)
                        }
            // MARK: - Infinity Scroll with GeometryReader
                        if comicViewModel.offset == comicViewModel.fetchedComics.count{
                            // showing progress and adding new data
                            ProgressView()
                                .padding(.vertical)
                                .onAppear(perform: {
                                    print("fetching new data...")
                                    comicViewModel.fetchComics()
                                })
                        }
                        else{
                            GeometryReader{reader -> Color in
                                let minY = reader.frame(in: .global).minY      
                                let height = UIScreen.main.bounds.height / 1.3
                                
                // MARK: - When height goes beyond
                                if !comicViewModel.fetchedComics.isEmpty && minY < height{
                                    DispatchQueue.main.async{
                                        comicViewModel.offset = comicViewModel.fetchedComics.count
                                    }
                                }
                                return Color.clear
                            }
                            .frame(width: 20, height: 20)
                        }
                    }
                    .padding(.vertical)
                }
            })
        }
        // Cargando data
        .onAppear(perform: {
            if comicViewModel.fetchedComics.isEmpty{
                comicViewModel.fetchComics()
            }
        })
        .navigationTitle("Marvel's Comics")
    }
}
struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView(comicViewModel: ComicViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}
