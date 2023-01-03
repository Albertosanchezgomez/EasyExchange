//
//  ProductsProvider.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import Foundation

class ProductsProvider: NSObject {
    
    
    //TO DO: Improve function
    
    func getValue(exchanges: [ExchangeModel], products: [ProductModel]) -> ProductModel {
        
        var currentValue = ""
        var isValueFound = false
        var transactions = [TransactionsModel]()
        var euros = 0.0
        var product = ProductModel()
        
        products.forEach { prd in
            
            currentValue = prd.currency ?? ""
            euros = prd.amount ?? 0.0
            
            if( currentValue == "EUR"){
                
                euros = euros 
                
            } else {
                
                repeat {
                    
                    exchanges.forEach{ item in
                        
                        if(item.from == currentValue){
                            
                            if(item.to == "EUR"){
                                
                                isValueFound = true
                                
                                let initialValue = euros
                                
                                euros =  euros * item.rate
                                
                                let transaction = TransactionsModel(from: item.from, to: item.to, initialValue: initialValue , value: euros)
                                
                                transactions.append(transaction)

                            } else {
                                
                                currentValue = item.to
                                let initialValue = euros
                                euros = euros * item.rate
                                let transaction = TransactionsModel(from: item.from, to: item.to, initialValue: initialValue, value: euros)
                                transactions.append(transaction)
                            }
                        }
                    }
                    
                } while !isValueFound
            }
           
            
        }
        
        product.finalValue = euros
        product.transactions = transactions
        
        return product
    }
}
