//
//  AlertPresentationView.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 16/03/21.
//

import Foundation
import UIKit
class AlertBuilder {
    static func buildAlertController(for model: AlertModel) -> UIAlertController {
        let controller = UIAlertController(title: model.title, message: model.message, preferredStyle: model.prefferedStyle)
        
        model.actionModels.forEach({ controller.addAction(UIAlertAction(title: $0.title, style: $0.style, handler: $0.handler)) })
        
        return controller
    }
}

protocol AlertPresentableViewModel {
    var alertModel: Observable<AlertModel?> { get set }
}
protocol AlertPresentableView {
    associatedtype ModelType: AlertPresentableViewModel
    
    var model: ModelType { get set }
}

extension AlertPresentableView where Self: UIViewController {
    func bindToAlerts() {
        model.alertModel.observeOn(.main).observeNext { [weak self] (model) in
            guard let model = model else {
                return
            }
            
            let alert = AlertBuilder.buildAlertController(for: model)
            self?.present(alert, animated: true, completion: nil)
        }.dispose(in: bag)
    }
}


