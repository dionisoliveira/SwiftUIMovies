//
//  ContentView.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 10/03/21.
//

import SwiftUI

struct MovieListView: View {
    
    //Inject IoC in ViewModel
    @ObservedObject  var viewModel = MovieListViewModel()
   

    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
               
                List(viewModel.Movies,id:  \.self.id) {
                   
                    movieRow in
                    NavigationLink(destination:LazyView(viewModel.navigationToAny(model: movieRow) as! AnyView)) {
                                MovieRowCell(movie: movieRow)
                                   }
                   
                }.navigationTitle("Favoritos").foregroundColor(.red)
                
            }
           
           
           
            .onAppear {
                viewModel.fetchMovieList()
            }.alert(isPresented: $viewModel.isPresented) {
                viewModel.dequeue()
                
            }
            
        }
       
    }
   
   
    
    
   
}


public struct LazyView<Content: View>: View {
    private let build: () -> Content
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}





#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView().environmentObject(MovieListViewModel())
       
    }
}
#endif
