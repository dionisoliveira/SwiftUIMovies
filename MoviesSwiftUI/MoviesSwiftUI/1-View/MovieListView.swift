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
        VStack{
         
            List(viewModel.Movies) {
                currencyrow in  MovieRowCell(movie: currencyrow)
            }.alert(isPresented: $viewModel.isPresented) {
                viewModel.dequeue()
            }
        }.onAppear {
            viewModel.LoadMoviesList()
        }
       
    }
}



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView().environmentObject(MovieListViewModel())
       
    }
}
#endif
