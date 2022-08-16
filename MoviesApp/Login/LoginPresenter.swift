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
    
    func succesedLogin() {
        view?.loading(show: false)
        router?.goToMenu()
    }
    
    func errorLogin(error: Error) {
        view?.loading(show: false)
        view?.error(text: error.localizedDescription)
    }
    
    
    func login(username: String?, password: String?) {
        if let password = password, let username = username, !password.isEmpty, !username.isEmpty {
            view?.loading(show: true)
            interactor?.login(username: username, password: password)
        } else {
            view?.error(text: "Campos Vacios")
        }
    }

}
