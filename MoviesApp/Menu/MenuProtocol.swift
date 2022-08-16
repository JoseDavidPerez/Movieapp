//
//  MenuProtocol.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation

protocol MenuViewProtocol {
    
    func loading(show: Bool)
    func error(text: String)
    func reloadData(data: [MovieResponse])
}

protocol MenuPresenterProtocol {
    func showDetailMovie(movie: MovieResponse)
    func getRaking()
    func getMovies(type: MenuOptionEnum)
    func succesedMovies(data: MoviesResponse)
    func errorMovie(error: Error)
    func succesedRaking(data: MoviesResponse)
    func errorRaking(error: Error)
    func goToProfile()
}

protocol MenuInteractorProtocol {
    func getRaking()
    func getMovies(type: MenuOptionEnum)
    
}

protocol MenuRouterProtocol {
    func respondeDetailMovie(movie: MovieResponse)
    func goToProfile()
}
