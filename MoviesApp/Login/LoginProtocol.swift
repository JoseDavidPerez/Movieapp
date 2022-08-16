//
//  LoginProtocol.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation
import UIKit


protocol LoginViewProtocol {
    func loading(show: Bool)
    func error(text: String)
}

protocol LoginPresenterProtocol {
    func login(username: String?, password: String?)
    func succesedLogin()
    func errorLogin(error: Error)
}

protocol LoginInteractorProtocol {
    func login(username: String, password: String)
    
}

protocol LoginRouterProtocol {
    func goToMenu()
}
