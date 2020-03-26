//
//  ContactsListViewController.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 03/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var controller: ContactsController = ContactsController()
    
    
    
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupNavigationController()
        setupTableView()
        setupSearchController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        loadSavedContact()
    }
    
    func setupTableView() {
        
        self.contactsTableView.delegate = self
        self.contactsTableView.dataSource = self
    }
    
    func setupNavigationController(){
        navigationItem.title = "Contatos"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    func loadSavedContact() {
        
        controller.getContact(completion: { (success) in
            if success {
                self.contactsTableView.reloadData()
            }
        })
    }
    
    
    
    func setupSearchController() {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.delegate = self
        searchController?.searchBar.delegate = self
        
        
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder  = "Busca"
        
        searchController?.hidesNavigationBarDuringPresentation = false
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        let searchBar = searchController?.searchBar
        searchBar?.searchBarStyle = .prominent
        searchBar?.searchTextField.textColor = .black
        
        
        searchBar?.tintColor = UIColor.white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
    }
    
    
}

extension ContactsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return controller.numberOfRowInSection()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        
        cell?.setupCell(contact: controller.getContactByIndex(indexPath: indexPath))
        
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        print("pegou trailing")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if !self.controller.filteredContactListIsEmpty() {
            
            
            let deleteAction = UIContextualAction(style: .normal, title: "") { (action, view, (Bool) -> Void) in
                
                self.controller.removeContactByIndex(indexPath: indexPath)
                
                self.controller.deleteObjectByID(indexPath: indexPath) { (success) in
                    if success {
                        self.contactsTableView.reloadData()
                    }
                }
            }
            
            deleteAction.image = .remove
            
            let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
            swipeActionConfiguration.performsFirstActionWithFullSwipe = true
            
            return swipeActionConfiguration
            
        } else {
            
            return nil
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailContactVc: DetailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController")  ?? DetailViewController()
        
        detailContactVc.detailController = DetailController(contact: controller.getContactByIndex(indexPath: indexPath))
        
        
        navigationController?.pushViewController(detailContactVc, animated: true)
    }
    
}




extension ContactsListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.controller.filterContact(searchText: searchText)
    }
}




extension ContactsListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.contactsTableView.reloadData()
    }
}



