//
//  TableRow.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import UIKit

/// `TableRow`
protocol TableRow {
    var configuredCell: (_ id: String, _ cell: UITableViewCell?) -> UITableViewCell { get }
    static var cellIdentifier: String { get }
}

extension TableRow {
    var cellId: String { return Self.cellIdentifier }
}
