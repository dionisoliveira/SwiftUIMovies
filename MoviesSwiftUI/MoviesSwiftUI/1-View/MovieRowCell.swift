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
        VStack(alignment: .leading){
            Text(movie.title)
            Text(movie.original_title)
        }.background(Color.blue)
     
    }
}



#if DEBUG

struct CurrencyRow_Previews: PreviewProvider {
   
    static var previews: some View {
     
        MovieRowCell(movie:MovieListViewModel().mockMoview ).frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
#endif
