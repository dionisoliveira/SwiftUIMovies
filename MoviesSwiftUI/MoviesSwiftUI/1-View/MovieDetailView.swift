//
//  MovieDetailView.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 17/03/21.
//

import Foundation
import SwiftUI
struct MovieDetailView: View {
    
    var model: MovieModel
    
   
    var body: some View {
        ScrollView{
            VStack(){
                ImageUI(model.poster_path!)
                    .frame(width: 150, height: 250, alignment: .center)
                VStack(alignment: .center){
                    Text(model.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                    Text(model.overview).font(.body).foregroundColor(.white)
                    Spacer()
                    
                }.padding()                
            }
            
        }.background(Color(.black))
        
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
