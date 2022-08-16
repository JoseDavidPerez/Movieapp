//
//  MovieResponse.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation

struct MoviesResponse : Codable {
    
    let page : Int
    let results : [MovieResponse]
    
    private enum CodingKeys : String , CodingKey {
        case page
        case results
        
    }
}

struct MovieResponse : Codable {
    
    let title : String
    let date : String
    let description : String
    let rating : Double
    let img : String
    let vote : Int
    let popularity : Double
    let lenguage : String
    
    private enum CodingKeys : String , CodingKey {
        
        case title = "name"
        case date = "first_air_date"
        case description = "overview"
        case rating = "vote_average"
        case img = "poster_path"
        case vote = "vote_count"
        case popularity = "popularity"
        case lenguage = "original_language"
        
    }
    
    func getUrl() -> String{
        return "\(MovieApi.baseImg)\(img)"
    }
    
}
