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
    init() {
        setupApperance()
    }
    var body: some Scene {
        
        WindowGroup {
            MovieListView()
            
        }
    }
    
    private func setupApperance() {
      /*  UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "steam_gold")!,
            NSAttributedString.Key.font: UIFont(name: "FjallaOne-Regular", size: 40)!]
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "steam_gold")!,
            NSAttributedString.Key.font: UIFont(name: "FjallaOne-Regular", size: 18)!]
        
        UIBarButtonItem.appearance().setTitleTextAttributes([
                                                                NSAttributedString.Key.foregroundColor: UIColor(named: "steam_gold")!,
                                                                NSAttributedString.Key.font: UIFont(name: "FjallaOne-Regular", size: 16)!],
                                                            for: .normal)*/
        
       // UIWindow.appearance().tintColor = UIColor(named: "steam_gold")
      
    }
}
