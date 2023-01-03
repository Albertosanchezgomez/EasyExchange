//
//  TransactionsModel.swift
//  EasyExchange
//
//  Created by Alberto Sanchez Gomez on 3/1/23.
//


import Foundation

struct TransactionsModel: Codable, Hashable {
    
    var from: String
    var to: String
    var initialValue: Double
    var value: Double

}
