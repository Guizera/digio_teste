//
//  HomeView.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 13/12/20.
//

import Foundation

class HomeView {
    
    var spotlight: [Spotlight] = []
    var products: [Product] = []
    var delegate: HomeViewControllerDelegate
    var welcome: String!
    var cash: Cash?
    
    
    init(_ delegate: HomeViewControllerDelegate) {
        
        self.welcome = "Olá, Maria"
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            
            ApiService.products { result in
                switch result {
                case .success(let response):
                    self.spotlight = response.spotlight
                    self.products = response.products
                    self.cash = response.cash
                    self.delegate.loadingCollections()
                case .failure(_):
                    self.delegate.showError(message: "Ops: Um erro aconteceu, tente novamente")
                }
                
            }
            
        })
        
    }
}
