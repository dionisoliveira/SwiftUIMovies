//
//  NavigationControllerProtocol.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 18/03/21.
//

import Foundation

protocol NavigationControllerProtocol {
  //  func NavigationTo(view:ViewEnum, model: BaseModelProtocol)->NavigationControllerProtocol
    func NavigationToAny(view:ViewEnum, model: BaseModelProtocol) -> Any
}
