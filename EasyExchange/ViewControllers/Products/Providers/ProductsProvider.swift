//
//  ProductsProvider.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import Foundation

class ProductsProvider: NSObject {
    
    
    //TO DO: Improve function
    
    func getValue(exchanges: [ExchangeModel], product: ProductModel) -> Double {
        
        
        // This function can be improved a lot, but im using a public Mac and have to upload the project now, sorry
        
        var currentValue = ""
        var isValueFound = false
        var euros = 0.0
        
        currentValue = product.currency
        euros = product.amount
        
        
        exchanges.forEach{ item in
            
            if(item.from == currentValue){
                
                if(item.to == "EUR"){
                    
                    isValueFound = true
                    euros = euros * item.rate
                    
                } else {
                    
                    currentValue = item.to
                    euros = euros * item.rate
                    
                }
            }
        }
        
        if(!isValueFound){
            
            exchanges.forEach{ item in
                
                if(item.from == currentValue){
                    
                    if(item.to == "EUR"){
                        
                        isValueFound = true
                        euros = euros * item.rate
                        
                    } else {
                        
                        currentValue = item.to
                        euros = euros * item.rate
                        
                    }
                }
            }
            
        }
        
        if(!isValueFound){
            
            exchanges.forEach{ item in
                
                if(item.from == currentValue){
                    
                    if(item.to == "EUR"){
                        
                        isValueFound = true
                        euros = euros * item.rate
                        
                    }
                }
            }
            
        }
        
        return euros
    }
}
