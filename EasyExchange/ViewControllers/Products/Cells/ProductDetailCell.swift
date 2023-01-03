//
//  ProductDetailCell.swift
//  EasyExchange
//
//  Created by Alberto Sanchez Gomez on 3/1/23.
//

import UIKit

class ProductDetailCell: UITableViewCell {
    
    @IBOutlet weak var LBLleft: UILabel!
    @IBOutlet weak var LBLRight: UILabel!
    
    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK:  Cell Functions

    
    func fillCell(exchange: TransactionsModel?){
        
        guard let transaction = exchange else {
            return
        }
      
        LBLleft.text = "\(transaction.initialValue.rounded()) \(transaction.from)"
        LBLRight.text = "\(transaction.value.rounded()) \(transaction.to)"

        
    }
    
    
}

    

