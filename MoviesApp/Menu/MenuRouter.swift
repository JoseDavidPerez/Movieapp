//
//  MenuRouter.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation
import UIKit

internal class MenuRouter {
    
    public var navigation : UINavigationController?
    
    
}

extension MenuRouter : MenuRouterProtocol {
    
    public static func createModule(navigation: UINavigationController?) -> UIViewController {
        
        let viewController : MenuView = MenuView()
        
        if let nav = navigation {
            let presenter = MenuPresenter()
            let router = MenuRouter()
            let interactor = MenuInteractor()
            
            viewController.presenter = presenter
            
            presenter.view = viewController
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = nav
            interactor.presenter = presenter
            
            return viewController
            
        }
        
        return UIViewController()
        
    }
    
}
