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
    
     var  models: BaseModelProtocol = BaseModel()
     var enumNavigation:ViewEnum = ViewEnum.MovieDetail
    
    
    
   /* func GetView() ->  Any{
        switch enumNavigation {
        case .MoviewList:
            let view = AnyView(  MovieDetailView(model: models as! Movie) )
            return view
        case .MovieDetail:
            let view = AnyView(MovieDetailView(model: models as! Movie))
            
            return view
        default:
            let view = AnyView(MovieListView())
            return view
        }
    }
    
    func NavigationTo(view:ViewEnum, model: BaseModelProtocol) -> NavigationControllerProtocol{
        models = model
        enumNavigation = view
        return self
        
    }*/
    
    func NavigationToAny(view:ViewEnum, model: BaseModelProtocol) -> Any {
        switch view {
        case .MoviewList:
            let view = AnyView(MovieListView() )
            return view
        case .MovieDetail:
            let view = AnyView(MovieDetailView(model: model as! Movie))
            
            return view
        case .Default:
            let view = AnyView(SampleView())
            
            return view
        default:
            let view = AnyView(MovieListView())
            return view
        }
        
    }
    
}
