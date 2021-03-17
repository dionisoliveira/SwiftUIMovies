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
        //Set class for register in IOC
        DependencyInjector.register(dependency: HttpHelper() as HttpHelperProtocol)
       // DependencyInjector.register(dependency: AlertManager() as AlertManagerProtocol)
       // DependencyInjector.register(dependency: CurrencyViewModel() as CurrencyViewModelProtocol)
        //DependencyInjector.register(dependency: LoginAdm() as LoginAdmProtocol)
      
    }
}
