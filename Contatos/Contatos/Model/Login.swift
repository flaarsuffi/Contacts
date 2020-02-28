//
//  Login.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 15/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation

struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}
