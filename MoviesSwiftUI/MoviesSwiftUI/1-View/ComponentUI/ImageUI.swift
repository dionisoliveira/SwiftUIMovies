//
//  MovieImage.swift
//  MoviesSwiftUI
//
//  Created by Montreal on 17/03/21.
//

import Foundation
import SwiftUI
import Combine
import UIKit

class ImageViewModel: ObservableObject {
    
    @Published var image: UIImage = UIImage()
    @Inject var imageService: ImageServiceProtocol
    
    func GetImage(_ imagepath: String) {
     
        let patch =  "https://image.tmdb.org/t/p/w154/"+imagepath
        imageService.fechImage(patch) {
            
            (result: Result<Data,ImageError>) in
            switch result {
            case let .success(result):
                DispatchQueue.main.async {
                    self.image = UIImage(data: result)!
                }
             
            case let .failure(result):
                
            break;
                
            }
        }
     
    }
   
}


struct  ImageUI: View {
    
   
    @ObservedObject var imageModel =  ImageViewModel()
    var imagepath: String
    
    init(_ image:String) {
        imagepath = image
    }
    
    var body: some View {
       
        HStack{
          
            Image(uiImage: imageModel.image)
                .resizable()
                
        }.onAppear{
            imageModel.GetImage(imagepath)
        }
    
    }
    
    
   
    #if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ImageUI(MovieListViewModel().mockMoview.poster_path!)
           
        }
    }
    #endif

}
