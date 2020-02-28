//
//  User.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 15/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: Name
    var email: String
    var phone: String
    var picture: Picture
    var location: Location?
    var dob: Dob?

}
