//
//  RegisterIoC.swift
//  MoviesSwiftUI
//
//  Created by Montreal on 12/03/21.
//

import Foundation


struct RegisterIoC{
    init() {
        RegisterItens()
    }
    
    
     func RegisterItens(){
       
        DependencyInjector.register(dependency: HttpHelper() as HttpHelperProtocol)
        DependencyInjector.register(dependency: ImageService() as ImageServiceProtocol)
        DependencyInjector.register(dependency: NavigationController() as NavigationControllerProtocol)
     
      
    }
}
