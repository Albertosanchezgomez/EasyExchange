//
//  ProductService.swift
//  EasyExchange
//
//  Created by Alberto Sanchez Gomez on 30/12/22.
//

import Foundation

class ProductService {
    
    func getProducts(callBack: @escaping ([ProductModel]) -> Void) {
        
        let session = URLSession.shared
        
        let endpoint = Endpoints().getEndpoint(endpoint: .transactions)
        
        let network =  NetworkBuilder()
        
        let url = network.buildUrl(endpoint: endpoint)
                
        let task = session.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            if error != nil {
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode([ProductModel].self, from: data! )
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    callBack(json)
                }
                
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()
        
        
        
    }
}
