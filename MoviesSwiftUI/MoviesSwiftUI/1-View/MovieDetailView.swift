//
//  MovieDetailView.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 17/03/21.
//

import Foundation
import SwiftUI
struct MovieDetailView: View {
    
    var model: Movie
    
   
    var body: some View {
        Text(model.title)
        Text(model.overview)
        Divider()
      
    }
}

#if DEBUG
struct CurrencyViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        let model = MovieListViewModel();
        MovieDetailView(model:model.mockMoview)
    }
}
#endif
