//
//  ContactViewModel.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol Contactable {
    var datasource: Driver<[TableDatasource.Section]> {get}
}

class ContactViewModel: Contactable {
    let datasource: Driver<[TableDatasource.Section]>
    /// `dependency inversion`
    init(_ provider: ContactProviderType) {
        self.datasource = provider
            .contacts
            .map { items -> [TableDatasource.Section] in
                /// groupedByNationality = [Nationality: [Person]]` ///new feature in swift 4.x
                /// let groupedByNationality  = Dictionary(grouping: items) { $0.nationality }
                /// For this example we are going to use the `LastName`
                /// `grouped = [Character: [Person]]` ///new feature in swift 4.x
                let grouped = Dictionary(grouping: items) { $0.lastName.first! }
                let keys = grouped.keys.sorted()
                return keys.map { key -> TableDatasource.Section in
                    let rows = grouped[key]?.compactMap(PersonRow.init) ?? []
                    return TableDatasource.Section(title: String(key), rows: rows)
                }
            }
            .asDriver(onErrorJustReturn: [])
    }
}
