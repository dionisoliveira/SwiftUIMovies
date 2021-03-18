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
    
    private var isfetch:Bool = false
    @Published var image: UIImage = UIImage()
    @Inject var imageService: ImageServiceProtocol
    
    func GetImage(_ imagepath: String) {
        if isfetch == true {
            return
        }
        
        let patch =  "https://image.tmdb.org/t/p/w154/"+imagepath
        imageService.fechImage(patch) {
            
            (result: Result<Data,ImageError>) in
            switch result {
            case let .success(result):
                DispatchQueue.main.async {
                    self.image = UIImage(data: result)!
                    self.isfetch = true;
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
        imageModel.GetImage(imagepath)
    }
    
    var body: some View {
       
        HStack{
          
            Image(uiImage: imageModel.image)
                .resizable()
                
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
