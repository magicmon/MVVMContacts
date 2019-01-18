//
//  Storyboard+Extension.swift
//  MVVMContacts
//
//  Created by magicmon on 18/01/2019.
//  Copyright © 2019 magicmon. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardIdentifiable: class {}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var storyboardNaviIdentifier: String {
        return String(describing: self) + "_Navi"
    }
}

extension UIViewController: StoryboardIdentifiable {
    static func instantiate(from storyboard: Storyboard) -> Self {
        return storyboard.viewController(of: self)
    }
    
    static func instantiateOfNavi(from storyboard: Storyboard) -> UINavigationController {
        return storyboard.naviViewController(of: self)
    }
}

// MARK: Storyboard enum
enum Storyboard: String {
    case Main
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(of type: T.Type) -> T {
        let identifier = type.storyboardIdentifier
        return instance.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    func viewController(of identifier: String) -> UIViewController {
        return instance.instantiateViewController(withIdentifier: identifier)
    }
    
    func naviViewController<T: UIViewController>(of type: T.Type) -> UINavigationController {
        let identifier = type.storyboardNaviIdentifier
        return instance.instantiateViewController(withIdentifier: identifier) as! UINavigationController
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
