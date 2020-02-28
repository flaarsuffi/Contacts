//
//  ContactsController.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 22/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation

class ContactsController {
    
    var arrayContact:[Contact] = []
    var filteredContactList: [Contact] = []
    
    let coreDataManager = CoreDataManager()
    
    func getContact(completion: @escaping (Bool) -> Void) {
        coreDataManager.loadContact { (arrayContact) in
            self.arrayContact = arrayContact
            self.filteredContactList = arrayContact
            print(self.arrayContact.count)
            completion(true)
        }
    }
    
    func numberOfRowInSection() -> Int {
        
        return filteredContactList.count
        
    }
    
    func getContactByIndex(indexPath: IndexPath) -> Contact {
        
        return filteredContactList[indexPath.row]
        
    }
    
    func filteredContactListIsEmpty() -> Bool {
        
        
        return filteredContactList.isEmpty
    }
    
    func removeContactByIndex(indexPath: IndexPath) {
        
        filteredContactList.remove(at: indexPath.row)
    }
    
    func deleteObjectByID(indexPath: IndexPath, completion: @escaping (Bool) -> Void) {
        let temp: Contact = getContactByIndex(indexPath: indexPath)
        
        self.coreDataManager.deleteContact(id: temp.objectID ) { (success) in
            
            if success {
                completion(true)
            }
        }
    }
    
    func filterContact(searchText: String){
        if searchText.isEmpty {
            self.filteredContactList = self.arrayContact
        } else {
            self.filteredContactList = self.arrayContact.filter{
                ($0.name?.localizedCaseInsensitiveContains(searchText) ?? false)
            }
        }
    }
    

    
}
