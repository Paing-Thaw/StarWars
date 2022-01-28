//
//  LoadData.swift
//  TVShow
//
//  Created by Eureka Tatsu on 1/27/22.
//

import Foundation

class LoadData {
    var films: [AllFilmsQuery.Data.AllFilm.Film] = []
    var characters: [AllFilmsQuery.Data.AllFilm.Film.CharacterConnection.Character] = []
   
}
extension LoadData {
    func loadData() {
        let query = AllFilmsQuery()
        Apollo.shared.client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let films = graphQLResult.data?.allFilms?.films?.compactMap({ $0 }) {
                    self.films = films
                }
                
            case .failure(let error):
                print("Error loading data \(error)")
            }
        }
    }
}
