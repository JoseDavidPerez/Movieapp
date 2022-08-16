//
//  DetailPresenter.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation

 internal class DetailMoviePresenter {
     
     public var view : DetailMovieViewProtocol?
     public var interactor: DetailMovieInteractorProtocol?
     public var router: DetailMovieRouterProtocol?
}

extension DetailMoviePresenter : DetailMoviePresenterProtocol {
    
}
