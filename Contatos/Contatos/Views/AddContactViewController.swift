//
//  AddContactViewController.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 03/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import UIKit
import SDWebImage

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var randomUserButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var userRandom: UserResult?
    var network: Network?
    var coreDataManager: CoreDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
        
        setUpElements()
        setup()
    }
    
    func setup() {
        network = Network()
        network?.delegate = self
        coreDataManager = CoreDataManager()
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(nameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(telephoneTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(cityTextField)
        Utilities.styleTextField(stateTextField)
        Utilities.styleTextField(notesTextField)
        
        
        Utilities.styleFilledButton(randomUserButton)
        Utilities.styleHollowButton(saveButton)
        
        
    }
    
    
    @IBAction func tappedRandomUserButton(_ sender: UIButton) {
        network?.getRandomUser(page: 1)
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        
        saveInCoreData()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedCancelButton(_ sender: UIButton) {
    }
    
    
    func populateView() {
        self.nameTextField.text = self.userRandom?.results.first?.name.first
        self.lastNameTextField.text = self.userRandom?.results.first?.name.last
        self.telephoneTextField.text = self.userRandom?.results.first?.phone
        self.emailTextField.text = self.userRandom?.results.first?.email
        self.cityTextField.text = self.userRandom?.results.first?.location?.city
        self.stateTextField.text = self.userRandom?.results.first?.location?.state
        self.userImageView.sd_setImage(with: self.userRandom?.results.first?.picture.large)

        
    }
    
    func saveInCoreData() {
        let name = self.userRandom?.results.first?.name.first ?? ""
        let lastName = self.userRandom?.results.first?.name.last ?? ""
        let phone = self.userRandom?.results.first?.phone ?? ""
        let email = self.userRandom?.results.first?.email ?? ""
        let city = self.userRandom?.results.first?.location?.city ?? ""
        let state = self.userRandom?.results.first?.location?.state ?? ""
        let userImage = self.userRandom?.results.first?.picture.large.absoluteString ?? ""
        let notes = notesTextField.text ?? ""
        
        coreDataManager?.saveContact(name: name, lastName: lastName, phone: phone, email: email, city: city, state: state, picture: userImage, notes: notes)
        
        coreDataManager?.loadContact(completion: { (contact) in
            print(contact)
        })
    }
}


extension AddContactViewController: UserProviderDelegate {
    func successGetUser(contact: UserResult) {
        self.userRandom = contact
        self.populateView()
    }
    
    func errorGetUser(error: Error?) {
        print(error as Any)
    }
}
