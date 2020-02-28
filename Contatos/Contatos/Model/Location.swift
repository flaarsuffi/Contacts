//
//  Location.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 15/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation

struct Location: Codable {
    var city, state: String?
    var postcode: Int?
    var coordinates: Coordinates?
    let timezone: Timezone?
}
