//
//  TableDataSource.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableDatasource: NSObject, UITableViewDataSource, RxTableViewDataSourceType, SectionedViewDataSourceType, UITableViewDelegate {
    struct Section {
        let title: String
        let rows: [TableRow]
        
        init(title: String, rows: [TableRow]) {
            self.title = title
            self.rows = rows
        }
    }
    
    private var _model: [Section] = []
    
    typealias Element = [Section]
    func tableView(_ tableView: UITableView, observedEvent: Event<[TableDatasource.Section]>) {
        Binder(self) {form, sections in
            form._model = sections
            tableView.reloadData()
            }
            .on(observedEvent)
    }
    
    func model(at indexPath: IndexPath) throws -> Any {
        return _model[indexPath.section].rows[indexPath.row]
    }
    //MARK: Table View Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < _model.count else { return 0 }
        return _model[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = _model[indexPath.section].rows[indexPath.row]
        /// In your App you should be using the storyboard to dequeue different cells
        /// If so then you can dequeue the cell as follows
        /// let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId, for: indexPath)
        /// item.configuredCell(item.cellId, cell)
        /// for this example we going to use only `PersonCell` so we pass a `nil`
        /// and let the `TableRow` take care of it. hope you get the trick!
        return item.configuredCell(item.cellId, nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section < _model.count else { return nil }
        return _model[section].title
    }
}
