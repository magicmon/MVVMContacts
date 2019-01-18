//
//  Person.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import Foundation

/// `Nationality`
enum Nationality: String {
    case german
    case italian
    case chinese
    case nigerian
    case british
}

/// `Person`
struct Person: Hashable {
    let firstName: String
    let lastName: String
    let age: Int
    let nationality: Nationality
}
