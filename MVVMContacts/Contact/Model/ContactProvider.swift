//
//  ContactProvider.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ContactProviderType {
    var contacts: Observable<Set<Person>> {get}
}

class ContactProvider: ContactProviderType {
    let contacts: Observable<Set<Person>>
    
    init() {
        self.contacts = Observable.of([
            Person(firstName: "Angela", lastName: "Merkel", age: 64, nationality: .german),
            Person(firstName: "Theresa", lastName: "May", age: 61, nationality: .british),
            Person(firstName: "Xi", lastName: "Jinping", age: 65, nationality: .chinese),
            Person(firstName: "Muhammadu", lastName: "Buhari", age: 75, nationality: .nigerian),
            Person(firstName: "Aliko", lastName: "Dangote", age: 61, nationality: .nigerian),
            Person(firstName: "Michele", lastName: "Ferrero", age: 93, nationality: .italian),
            Person(firstName: "Jack", lastName: "Ma", age: 53, nationality: .chinese),
            Person(firstName: "Silvio", lastName: "Berlusconi", age: 81, nationality: .italian),
            Person(firstName: "Richard", lastName: "Brandson", age: 67, nationality: .british),
            Person(firstName: "Georg", lastName: "Schaeffler", age: 53, nationality: .german),
            ])
    }
}
