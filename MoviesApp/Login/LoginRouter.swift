//
//  Router.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation
import UIKit

internal class LoginRouter {
    
}

extension LoginRouter : LoginRouterProtocol {
    
    public static func createModule() -> UIViewController {
        
        let viewController : LoginView = LoginView()
        
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return viewController
    }
}
