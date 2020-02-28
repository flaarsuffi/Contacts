//
//  Network.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 04/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation
import Alamofire

protocol UserProviderDelegate: class {
    
    func successGetUser(contact: UserResult)
    func errorGetUser(error: Error?)
}

class Network {
    
    weak var delegate: UserProviderDelegate?
    
    func getRandomUser (page: Int) {
        
        let urlString: String = "https://randomuser.me/api/?results=\(page)"
        
        if let url:URL = URL(string: urlString) {
            
            Alamofire.request(url, method: .get).responseJSON { (response) in
                
                if response.response?.statusCode == 200 {
                    do {
                        let model = try JSONDecoder().decode(UserResult.self, from: response.data ?? Data())
                        
                        print(model)
                        self.delegate?.successGetUser(contact: model)
                        
                    } catch  let error{
                        print( error)
                        self.delegate?.errorGetUser(error: error)
                    }
                }else {
                    
                    print(response.error ?? "")
                    self.delegate?.errorGetUser(error: response.error)
                }
            }
            
        }
        
    }
    
}



