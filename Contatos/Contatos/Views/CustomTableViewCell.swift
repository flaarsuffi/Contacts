//
//  CustomTableViewCell.swift
//  
//
//  Created by Flavia Arsuffi on 20/01/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
   
    var contactInfo = CoreDataManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    func setupCell(contact: Contact) {
        
        var _name: String = ""
        var _lastName: String = ""
        
        if let name = contact.name {
            _name = name
        }
        
        if let lastName = contact.lastName {
            _lastName = lastName
        }
        
        
        
        self.fullNameLabel.text = _name + " " + _lastName
        
        
        
        
    }

}
