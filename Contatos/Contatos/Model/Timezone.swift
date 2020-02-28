//
//  Timezone.swift
//  Contatos
//
//  Created by Flavia Arsuffi on 15/01/20.
//  Copyright © 2020 Flavia Arsuffi. All rights reserved.
//

import Foundation

struct Timezone: Codable {
    let offset, timezoneDescription: String?

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}
