//
//  MovieViewModel.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 16/03/21.
//

import Foundation

class  MovieListViewModel: ViewModelBase  {
    var count: Int = 0
    @Inject var httpHelper: HttpHelperProtocol
    @Inject var imageService: ImageServiceProtocol
    @Published var Movies: [MovieModel] = []
    
    override init() {
        super.init()
        
        //This code resolved a bug fix when using propagation Observable to propertie published [movie]
        //Remove this code, databinding stop to notification data in view.
        self.objectWillChange.send()
  
     
    }
    
    
    override func navigationTo( model:BaseModelProtocol) -> Any {
         
            return  navigation.NavigationToAny(view: ViewEnum.MovieDetail, model: model)
    }
   
    
    func fetchMovieList() {
        
        httpHelper.Get(.fetchMoviePopular()){
            (result:Result<ResultAPI<MovieModel>,HttpError>) in
            switch result {
            
            case let.success(response):
                DispatchQueue.main.async {
                let movies = (response.results as [MovieModel])
                        self.Movies = movies;
                }
               
                break
            case .failure(_):
                ShowError()
                break
            }
        }

        func ShowError() {
            self.enqueue("Failure process data")
          
        }
    }

    
    let mockMoview = MovieModel(id : 527774,
                          original_title: "Raya and the Last Dragon",
                          title: "Raya and the Last Dragon",
                          overview: "Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and it’s up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.",
                          poster_path: "/c7VlGCCgM9GZivKSzBgzuOVxQn7.jpg",
                          backdrop_path: "/c7VlGCCgM9GZivKSzBgzuOVxQn7.jpg",
                          popularity : 3673.696,
                          vote_average : 8.5,
                          vote_count : 1310,
                          release_date:  "2021-03-03",
                         // genres: [Genre(id: 0, name: "test")],
                          runtime: 80,
                          status: "released"  ,
                          video: false)
  
      

        
}
