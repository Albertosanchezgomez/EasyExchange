//
//  ProductDetailVC.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    @IBOutlet weak var LBLtitle: UILabel!
    @IBOutlet weak var LBLprice: UILabel!
    var product = ""
    var price = 0.0
    
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let price = Int(price)
        
        LBLprice.text = "\(price)\("€")"
        LBLtitle.text = "\(NSLocalizedString("item", comment: "")) \(product) \(NSLocalizedString("price", comment: "")) "
    }
    
    
}
