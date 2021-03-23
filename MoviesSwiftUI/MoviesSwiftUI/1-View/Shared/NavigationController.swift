//
//  NavigationController.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 18/03/21.
//

import Foundation
import SwiftUI
enum ViewEnum {
    
    case MoviewList, MovieDetail,Default
}



class  NavigationController:NavigationControllerProtocol {
    

    func NavigationToAny(view:ViewEnum, model: BaseModelProtocol) -> Any {
        switch view {
        case .MoviewList:
            let view = AnyView(MovieListView() )
            return view
        case .MovieDetail:
            let view = AnyView(MovieDetailView(model: model as! MovieModel))
            
            return view
        
        default:
            let view = AnyView(SampleView())
            return view
        }
        
    }
    
}
