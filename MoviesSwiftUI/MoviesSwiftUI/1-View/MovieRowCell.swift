//
//  MovieRowCell.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 17/03/21.
//

import SwiftUI

struct MovieRowCell: View {
    
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .center){
            VStack {
                ImageUI(movie.poster_path!)
                    .frame(width: 80, height: 100, alignment: .center)
                
                    .background(Color(.blue))
                    
                    
            }
            VStack {
                Text(movie.title).font(.title)
                Text(movie.original_title).font(.subheadline)
            }
            
        }.foregroundColor(.green)
     
    }
}



#if DEBUG

struct CurrencyRow_Previews: PreviewProvider {
   
    static var previews: some View {
        let viewModel = MovieListViewModel()
        
        MovieRowCell(movie:viewModel.mockMoview)
    }
}
#endif
