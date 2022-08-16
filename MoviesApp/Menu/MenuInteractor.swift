//
//  MenuInteractor.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation

internal class MenuInteractor {
    public var presenter : MenuPresenterProtocol?
}

extension MenuInteractor : MenuInteractorProtocol {
    
    func getMovies(type: MenuOptionEnum) {
        var url = ""
        switch type {
            
        case .popular:
            url = MovieApiUrl.popular.getUrl()
        case .top:
            url = MovieApiUrl.getTop.getUrl()
        case .tv:
            url = MovieApiUrl.tv.getUrl()
        case .live:
            url = MovieApiUrl.airing.getUrl()
        }
            
        MovieApi().getMovies(request: MoviesRequest(url: url)) { moviesResponse in
            self.presenter?.succesedMovies(data: moviesResponse)
        } onError: { error in
            self.presenter?.errorMovie(error: error)
        }
    }
    
    
    func getRaking() {
        
        MovieApi().getRakingShow(request: MoviesRequest(url: MovieApiUrl.getRakingShow.getUrl())) { moviesResponse in
            self.presenter?.succesedRaking(data: moviesResponse)
        } onError: { error in
            self.presenter?.errorRaking(error: error)
        }
    }
    
    
}
