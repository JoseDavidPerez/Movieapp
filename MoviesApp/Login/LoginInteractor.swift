//
//  Interactor.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation

internal class LoginInteractor {
    public var presenter : LoginPresenterProtocol?
}

extension LoginInteractor : LoginInteractorProtocol {
    
    func login(username: String, password: String) {
        MovieApi().newRequestToken(request: NewRequestTokenRequest(url: MovieApiUrl.newRequestToken.getUrl())) { tokenResponse in
            if tokenResponse.success {
                MovieApi().login(request: LoginRequest(url: MovieApiUrl.login.getUrl(), username: username, password: password, requestToken: "")) { loginResponse in
                    if loginResponse.success {
                        self.presenter?.succesedLogin()
                    }else{
                        self.presenter?.errorLogin(error: ApiError.recieveNilResponse)
                    }
                } onError: { error in
                    self.presenter?.errorLogin(error: error)
                }

            }else{
                self.presenter?.errorLogin(error: ApiError.recieveNilResponse)
            }
        } onError: { error in
            self.presenter?.errorLogin(error: error)
        }

    }
    
    
    func goToMenu() {
        
    }
    
    

    
}
