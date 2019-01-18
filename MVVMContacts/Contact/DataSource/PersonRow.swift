//
//  PersonRow.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import UIKit
import Foundation

struct PersonRow: TableRow {
    static var cellIdentifier: String { return "PersonRowCell" }
    let configuredCell: (_ id: String, _ cell: UITableViewCell?) -> UITableViewCell
    
    init(_ model: Person) {
        configuredCell = { id, cell in
            guard let cell = cell as? PersonCell else {
                let cell = PersonCell(style: .value2, reuseIdentifier: id)
                cell.bind(model)
                return cell
            }
            cell.bind(model)
            return cell
        }
    }
}
