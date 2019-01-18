//
//  ContactViewController.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContactViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    var viewModel: Contactable? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        tableView.register(PersonCell.self, forCellReuseIdentifier: PersonRow.cellIdentifier)
        
        /// Here goes the magical binding
        viewModel?
            .datasource
            .drive(tableView.rx.items(dataSource: TableDatasource()))
            .disposed(by: bag)
        /// Adding the `UITableView` as subview
        view.addSubview(tableView)
    }
}
