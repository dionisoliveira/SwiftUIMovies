//
//  ImageData.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 17/03/21.
//

import Foundation

struct ImageData:Codable, Identifiable {
    var id:String{
        file_path
    }
    
    let aspect_ratio:Float
    var file_path:String
   
    let height: Int
    let width: Int
}
