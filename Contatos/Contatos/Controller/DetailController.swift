//
//  DetailController.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 22/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation

class  DetailController {
    
    var contact: Contact
    
    init ( contact: Contact) {
        self.contact = contact
    }
    
    var fullName: String {
        return "\(self.contact.name ?? "") \(self.contact.lastName ?? "")"
    }
    
    var cellPhone: String {
        return "\(self.contact.phone ?? "")"
    }
    
    var email: String {
        return "\(self.contact.email ?? "")"
    }
    
    var city: String {
        return "\(self.contact.city ?? "")"
    }
    
    var state: String {
        return "\(self.contact.state ?? "")"
    }
    
}
