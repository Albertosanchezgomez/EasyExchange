//
//  ProductPresenter.swift
//  EasyExchange
//
//  Created by Alberto Sanchez Gomez on 30/12/22.
//

import Foundation


class ProductPresenter {
    
    private let exchangeService: ExchangeService
    weak private var exchangeProtocol: ExchangeProtocol?
    
    private let productService: ProductService
    weak private var productProtocol: ProductProtocol?
    
    init(productService: ProductService, exchangeService: ExchangeService) {
        
        self.productService = productService
        self.exchangeService = exchangeService

    }
    
    func initProtocol(exchangeProtocol: ExchangeProtocol, productProtocol: ProductProtocol) {
        
        self.exchangeProtocol = exchangeProtocol
        self.productProtocol = productProtocol

    }
    
  
    func getProducts() {
        
        self.productProtocol?.setStart()
        
        productService.getProducts { [weak self] products in
            if products.count == 0 {
                self?.productProtocol?.setEmptyProducts()
            } else {
                
                self?.productProtocol?.setProducts(products: products)
                self?.productProtocol?.setFinish()
            }
        }
        
    }
    
    func getExchanges() {
        
        exchangeService.getExchanges { [weak self] exchanges in
            
            if exchanges.count == 0 {
                
                print("No data")
                
            } else {
                
                self?.exchangeProtocol?.setExchanges(exchanges: exchanges)
            }
        }
        
    }
}
