//
//  ApiQueries.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import Foundation

class Endpoints {
    
     enum EndpointsTypes {

        case rates
        case transactions
        
    }
    
    func getEndpoint(endpoint: EndpointsTypes) -> String {
    
        switch endpoint {
        case .rates:
            return "/rates"
        case .transactions:
            return "/transactions"
            
        }
        
    }
}
