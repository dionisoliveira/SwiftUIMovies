//
//  ResultAPI.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 16/03/21.
//

import Foundation

struct ResultAPI<T: Codable>: Codable {
    let page: Int?
    let total_results: Int?
    let total_pages: Int?
    let results: [T]
}
