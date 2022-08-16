//
//  Router.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation
import UIKit

internal class LoginRouter {
    
    public var navegation : UINavigationController?
    
}

extension LoginRouter : LoginRouterProtocol {
    
    func goToMenu() {
        let menu = MenuRouter.createModule(navigation: navegation)
        navegation?.pushViewController(menu, animated: true)
    }
    
    
    public static func createModule(navegation : UINavigationController) -> UIViewController {
        
        let viewController : LoginView = LoginView()
        
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.navegation = navegation
        
        return viewController
    }
}
