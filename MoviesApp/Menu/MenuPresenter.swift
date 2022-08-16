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
    
    func goToProfile() {
        router?.goToProfile()
    }
    
    
    func succesedMovies(data: MoviesResponse) {
        view?.loading(show: false)
        view?.reloadData(data: data.results)
    }
    
    func errorMovie(error: Error) {
        view?.loading(show: false)
        view?.error(text: error.localizedDescription)
    }
    
    
    func getMovies(type: MenuOptionEnum) {
        interactor?.getMovies(type: type)
        
    }
    
    func showDetailMovie(movie: MovieResponse){
        router?.respondeDetailMovie(movie: movie)
    }
    
    func getRaking() {
        view?.loading(show: false)
        interactor?.getRaking()
    }
    
    func succesedRaking(data: MoviesResponse) {
        view?.reloadData(data: data.results)
    }
    
    func errorRaking(error: Error) {
        view?.loading(show: false)
        view?.error(text: error.localizedDescription)
    }
    
    
}
