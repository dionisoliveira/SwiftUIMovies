//
//  MovieViewModel.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 16/03/21.
//

import Foundation

class  MovieListViewModel: ViewModelBase  {
    
    @Inject var httpHelper: HttpHelperProtocol
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
    
   
    
    
    func LoadMoviesList() {
        
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
   
    func MockData(){
      
      var movie:[Movie] = []
      self.Movies = []
      let movie1 =  Movie(id: 0,
                                original_title: "Test movie Test movie Test movie Test movie Test movie Test movie Test movie ",
                                title: "Test movie Test movie Test movie Test movie Test movie Test movie Test movie  Test movie Test movie Test movie",
                                overview: "Test desc",
                                poster_path: "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
                                backdrop_path: "/nl79FQ8xWZkhL3rDr1v2RFFR6J0.jpg",
                                popularity: 50.5,
                                vote_average: 8.9,
                                vote_count: 1000,
                                release_date: "1972-03-14",
                               // genres: [Genre(id: 0, name: "test")],
                                runtime: 80,
                                status: "released"  ,
                                video: false)
        
      
        movie.append(movie1)
      
            self.Movies = movie
     
    }
    
    let mockMoview = Movie(id: 0,
                          original_title: "This is Title  ",
                          title: "This is ",
                          overview: "Test desc",
                          poster_path: "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
                          backdrop_path: "/nl79FQ8xWZkhL3rDr1v2RFFR6J0.jpg",
                          popularity: 50.5,
                          vote_average: 8.9,
                          vote_count: 1000,
                          release_date: "1972-03-14",
                         // genres: [Genre(id: 0, name: "test")],
                          runtime: 80,
                          status: "released"  ,
                          video: false)
  

        
}
