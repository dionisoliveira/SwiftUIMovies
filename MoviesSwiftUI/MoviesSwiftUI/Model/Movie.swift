//
//  Movie.swift
//  MoviesSwiftUI
//
//  Created by Montreal on 12/03/21.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    
    let original_title: String
    let title: String
  
    
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let popularity: Float
    let vote_average: Float
    let vote_count: Int
    
    let release_date: String?
    var releaseDate: Date? {
        return release_date != nil ? Movie.dateFormatter.date(from: release_date!) : Date()
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        return formatter
    }()
    
   // let genres: [Genre]?
    let runtime: Int?
    let status: String?
    let video: Bool
    
   // var keywords: Keywords?
  //  var images: MovieImages?
    
    var production_countries: [productionCountry]?
    
    var character: String?
    var department: String?
    
   // struct Keywords: Codable {
   //     let keywords: [Keyword]?
   // }
    
    struct MovieImages: Codable {
        let posters: [ImageData]?
        let backdrops: [ImageData]?
    }
    
    struct productionCountry: Codable, Identifiable {
        var id: String {
            name
        }
        let name: String
    }
}
