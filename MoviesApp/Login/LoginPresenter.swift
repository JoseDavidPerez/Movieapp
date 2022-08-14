//
//  Presenter.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation
import UIKit

class LoginPresenter {
    
    public var view: LoginViewProtocol?
    public var interactor: LoginInteractorProtocol?
    public var router: LoginRouterProtocol?
    
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func notifyMenu(navegation: UINavigationController) {
        let menu = MenuRouter.createModule(navigation: navegation)
        navegation.pushViewController(menu, animated: true)
    }
    
}
