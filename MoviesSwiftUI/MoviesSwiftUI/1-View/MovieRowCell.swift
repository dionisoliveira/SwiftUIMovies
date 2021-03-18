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
            }
            VStack(alignment: .center) {
                Text(movie.title).font(.body)
              
            }
           Spacer()
        }.foregroundColor(.white)
         .background(Color(.black))
       
     
    }
}



#if DEBUG

struct CurrencyRow_Previews: PreviewProvider {
   
    static var previews: some View {
        let viewModel = MovieListViewModel()
        
        MovieRowCell(movie:viewModel.mockMoview) .previewLayout(.fixed(width: 300, height: 130))
    }
}
#endif
