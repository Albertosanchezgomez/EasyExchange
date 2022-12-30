//
//  NetworkBuilder.swift
//  EasyExchange
//
//  Created by AlbertoDev on 22/12/22.
//

import Foundation

class NetworkBuilder {
    
    let baseUrl = "https://android-ios-service.herokuapp.com"
    
    
    // MARK:  Network Functions

    func buildUrl(endpoint: String?) -> String {
        
        if let endpoint = endpoint {
            
            let finalUrl = "\(baseUrl)\(endpoint)"
            
            return finalUrl
            
        } else {
            
            return ""
            
        }
        
    }
    
    func getProducts(endpoint: String?, finished: @escaping ([ProductModel]) -> Void  )  {
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: URL(string: buildUrl(endpoint: endpoint))!, completionHandler: { data, response, error in
            
            if error != nil {
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode([ProductModel].self, from: data! )
                finished(json)
                
                
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()
    }
    
    
   
    
}
