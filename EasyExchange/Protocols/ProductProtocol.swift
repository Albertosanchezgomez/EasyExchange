//
//  ProductProtocol.swift
//  EasyExchange
//
//  Created by Alberto Sanchez Gomez on 30/12/22.
//

import Foundation

protocol ProductProtocol: NSObjectProtocol {
    
    func setProducts(products: [ProductModel])
    func setEmptyProducts()
    
}
