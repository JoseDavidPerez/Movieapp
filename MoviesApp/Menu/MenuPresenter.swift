//
//  MenuPresenter.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation

internal class MenuPresenter {
    
    public var view : MenuViewProtocol?
    public var interactor : MenuInteractorProtocol?
    public var router : MenuRouterProtocol?
}

extension MenuPresenter : MenuPresenterProtocol {
    
}
