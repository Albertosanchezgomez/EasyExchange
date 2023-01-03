//
//  ExchangeService.swift
//  EasyExchange
//
//  Created by Alberto Sanchez Gomez on 30/12/22.
//

import Foundation

class ExchangeService {
    
    func getExchanges(callBack: @escaping ([ExchangeModel]) -> Void) {
        
        let session = URLSession.shared
        
        let endpoint = Endpoints().getEndpoint(endpoint: .rates)
        
        let network =  NetworkBuilder()
        
        let url = network.buildUrl(endpoint: endpoint)

        
        let task = session.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            if error != nil {
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode([ExchangeModel].self, from: data! )
                 
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
