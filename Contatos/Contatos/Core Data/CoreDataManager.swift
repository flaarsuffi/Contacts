//
//  CoreDataManager.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 15/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Contatos")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    func saveContact(name: String, lastName: String, phone: String, email: String, city: String, state: String, picture: String, notes: String) {
        let context = persistentContainer.viewContext
        let contact = Contact(context: context)
        
        contact.name = name
        contact.lastName = lastName
        contact.phone = phone
        contact.email = email
        contact.city = city
        contact.state = state
        contact.picture = picture
        contact.notes = notes
        
        try? context.save()
    }
    
    
    func loadContact(completion:([Contact]) -> Void) {
        
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        let result = try? context.fetch(request)
        let arrayContact = result as? [Contact] ?? []
        completion(arrayContact)
    }
    
    func deleteContact(id: NSManagedObjectID, completion: (Bool) -> Void) {
        let context = persistentContainer.viewContext
        let obj = context.object(with: id)
        context.delete(obj)
        do {
            try context.save()
            completion(true)
        } catch {
            completion(false)
        }
    }
    
}

