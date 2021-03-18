//
//  AlertManager.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 16/03/21.
//



import SwiftUI



class ViewModelBase: ObservableObject {

    @Published var isPresented = false
    @Inject var navigation: NavigationControllerProtocol
    private var queues: [Alert] = []

    init() {
  
       let cancellable = $isPresented
            .filter({ [weak self] isPresented in
                guard let self = self else {
                    return false
                }
                return !isPresented && !self.queues.isEmpty
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.isPresented = true
            })
        
       
        
    }
    func navigationToAny( model:BaseModelProtocol) -> Any {
        return navigation
        
    }
    func navigationTo( model:BaseModelProtocol) -> NavigationControllerProtocol {
        return navigation
        
    }
     
            
    func enqueue(_ message:String,_ title:String = "Alert",_ confirmation:String = "Ok") {
        let alert = Alert(title: Text(title), message: Text(message), dismissButton: .default(Text(confirmation)))
       
        queues.append(alert)
        
        isPresented = true
    }

    func dequeue() -> Alert {
        queues.removeFirst()
    }
}
