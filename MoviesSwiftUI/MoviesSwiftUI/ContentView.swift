//
//  ContentView.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 10/03/21.
//

import SwiftUI



struct ContentView: View {
    
    var helper = HttpHelper()
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
