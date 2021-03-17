//
//  MoviesSwiftUIApp.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 10/03/21.
//

import SwiftUI

@main
struct MoviesSwiftUIApp: App {
    let ioc: () =  RegisterIoC().RegisterItens()
    
    var body: some Scene {
        WindowGroup {
            MovieListView()
        }
    }
}
