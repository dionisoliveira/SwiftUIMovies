//
//  MovieViewModel.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 16/03/21.
//

import Foundation

class  MovieListViewModel: ViewModelBase  {
    
    @Inject var httpHelper: HttpHelperProtocol
    @Inject var imageService: ImageServiceProtocol
    @Published var Movies: [Movie] = []
    
    override init() {
        super.init()
        
        //This code resolved a bug fix when using propagation Observable to propertie published [movie]
        //Remove this code, databinding stop to notification data in view.
        objectWillChange.sink{
            () in
            self.objectWillChange.send()
        }
     
    }
    
    
    override func navigationToAny( model:BaseModelProtocol) -> Any {
       
        return  navigation.NavigationToAny(view: ViewEnum.Default, model: model)
        
    }
   // override func navigationTo( model:BaseModelProtocol) -> NavigationControllerProtocol {
    //   return  navigation.NavigationTo(view: ViewEnum.MovieDetail, model: model)
   // }
    
    func loadMoviesList() {
        
        httpHelper.Get("movie/popular", params: nil){
            (result:Result<ResultAPI<Movie>,HttpError>) in
            switch result {
            
            case let.success(response):
                DispatchQueue.main.async {
                let movies = (response.results as [Movie])
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

    
    let mockMoview = Movie(id: 0,
                          original_title: "Wonder Womand 1075  ",
                          title: "This is ",
                          overview: "Test desc",
                          poster_path: "/c7VlGCCgM9GZivKSzBgzuOVxQn7.jpg",
                          backdrop_path: "/c7VlGCCgM9GZivKSzBgzuOVxQn7.jpg",
                          popularity: 50.5,
                          vote_average: 8.9,
                          vote_count: 1000,
                          release_date: "1972-03-14",
                         // genres: [Genre(id: 0, name: "test")],
                          runtime: 80,
                          status: "released"  ,
                          video: false)
  

        
}
