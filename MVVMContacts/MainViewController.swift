//
//  MainViewController.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    @IBOutlet private weak var button: UIButton!
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        button.rx.tap.asDriver()
            .drive(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                
                
                let provider = ContactProvider()
                
                let viewController = ContactViewController.instantiate(from: .Main)
                viewController.viewModel = ContactViewModel(provider)
                
                
                self.navigationController?.pushViewController(viewController, animated: true)
            }).disposed(by: bag)
    }
}
