//
//  Utilities.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 03/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width - 40, height: 1)
        
        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.9701557755, blue: 0.6984558105, alpha: 1)
    
        textfield.borderStyle = .none
        
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleNotesTextField(_ textfield:UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width - 40, height: 1)
        
        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.9701557755, blue: 0.6984558105, alpha: 1)
    
        textfield.borderStyle = .none
        
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    
    static func styleFilledButton(_ button:UIButton) {
        

        button.backgroundColor = #colorLiteral(red: 0, green: 0.6969105601, blue: 0.9031100869, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        

        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.04805964977, green: 0.6955853105, blue: 0.902109921, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor.black
    }
    
}
