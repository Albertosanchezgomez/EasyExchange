//
//  ProductCell.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import UIKit


class ProductCell: UITableViewCell {
    
    @IBOutlet weak var LBLname: UILabel!
    var delegate: ProductDelegate?
    var data : ProductModel?
    
    
    // MARK: Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK:  Cell Functions

    
    func fillCell(exchange: ProductModel?){
        
        guard let exchange = exchange else {
            return
        }
        
        self.LBLname.text = exchange.sku
        self.data = exchange
        
    }
    
    @IBAction func onItemPressed(_ sender: Any) {
        guard let data = self.data else {
            return
        }
        
        delegate?.showItem(item: data)
    }
}


protocol ProductDelegate {
    func showItem(item: ProductModel)
}
