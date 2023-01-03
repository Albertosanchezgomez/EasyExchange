//
//  HomeVC.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import UIKit

class ProductsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ProductDelegate{
    
    @IBOutlet weak var LBLtitle: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableview: UITableView!
    
    private let productPresenter = ProductPresenter(productService: ProductService(), exchangeService: ExchangeService())
    
    var count = 0
    var products = [ProductModel]()
    var allProducts = [ProductModel]()
    var exchanges = [ExchangeModel]()
    
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        self.tableview.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
        productPresenter.initProtocol(exchangeProtocol: self, productProtocol: self)
        productPresenter.getProducts()
        productPresenter.getExchanges()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.LBLtitle.text = NSLocalizedString("choose_item", comment: "")
    }
    
    // MARK: Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.delegate = self
        cell.fillCell(exchange: self.products[indexPath.row])
        return cell
    }
    
    // MARK: Products Delegate
    
    func showItem(item: ProductModel) {
        
        let groupedSku = self.allProducts.filter{ $0.sku ?? "" == item.sku ?? ""}
        
        let product = ProductsProvider().getValue(exchanges: self.exchanges, products: groupedSku)
        
        
        let value =  product.finalValue
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        
        vc.product = product
        vc.price = value
        vc.productName = item.sku ?? ""
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ProductsVC: ExchangeProtocol, ProductProtocol {
    
    func setStart() {
        
        self.activityIndicator.startAnimating()
    }
    
    func setFinish() {
        
        self.activityIndicator.stopAnimating()
    }
    
    
    func setProducts(products: [ProductModel]) {
        
        self.products = products.removingDuplicates()
        self.allProducts = products
        
        DispatchQueue.main.async {
            
            self.tableview.reloadData()
            
        }
    }
    
    
    func setExchanges(exchanges: [ExchangeModel]) {
        
        self.exchanges = exchanges
        
        
        DispatchQueue.main.async {
            
            self.tableview.reloadData()
            
        }
        
    }
    
    func setEmptyProducts() {
        self.tableview.isHidden = true
        
    }
    
    
}
