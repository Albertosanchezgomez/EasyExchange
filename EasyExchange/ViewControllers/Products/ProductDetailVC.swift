//
//  ProductDetailVC.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import UIKit

class ProductDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var LBLtitle: UILabel!
    @IBOutlet weak var LBLprice: UILabel!
    
    var productName = ""
    var price = 0.0
    var product = ProductModel()

    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ProductDetailCell.self, forCellReuseIdentifier: "ProductDetailCell")
        self.tableView.register(UINib(nibName: "ProductDetailCell", bundle: nil), forCellReuseIdentifier: "ProductDetailCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let price = Int(price.rounded())
        
        LBLprice.text = "\(price)\("€")"
        LBLtitle.text = "\(NSLocalizedString("item", comment: "")) \(productName) \(NSLocalizedString("price", comment: "")) "
    }
    
    // MARK: Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.transactions.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailCell", for: indexPath) as! ProductDetailCell
        cell.fillCell(exchange: self.product.transactions[indexPath.row])
        return cell
    }
    
}
