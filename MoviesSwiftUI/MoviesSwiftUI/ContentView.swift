//
//  ContentView.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 10/03/21.
//

import SwiftUI



struct ContentView: View {
    
    //Inject IoC in ViewModel
    @Inject var httpHelper: HttpHelperProtocol
    init() {
        Carregar(httpHelper)
    }
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
    }
}

func Carregar(_ protocols:HttpHelperProtocol) {
    
    protocols.Get("movie/popular", params: nil){
        (result:Result<Movie,HttpError>) in
        switch result {
        
        case let.success(response):
            break
        case .failure(_):
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
