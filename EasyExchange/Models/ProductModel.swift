//
//  ProductModel.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import Foundation

struct ProductModel : Codable, Hashable {
    
    
    var sku: String?
    var amount: Double?
    var currency: String?
    
    var transactions = [TransactionsModel]()
    var finalValue : Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case sku, amount, currency
    }
    
    init(){
        
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        sku = try values.decode(String.self, forKey: .sku)
        amount = try values.decode(Double.self, forKey: .amount)
        currency = try values.decode(String.self, forKey: .currency)
        
    }
}
