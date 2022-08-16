//
//  DetailMovieRouter.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation
import UIKit

internal class DetailMovieRouter {
    
    public var navigation : UINavigationController?
    
}

extension DetailMovieRouter : DetailMovieRouterProtocol {
    
    
    public static func createModule(navigation: UINavigationController?, movie: MovieResponse ) -> UIViewController {
        
        let viewController : DetailMovieView = DetailMovieView()
        viewController.movieData = movie
        
        if let nav = navigation {
            let presenter = DetailMoviePresenter()
            let router = DetailMovieRouter()
            let interactor = DetailMovieInteractor()
            
            viewController.presenter = presenter
            
            presenter.view = viewController
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = nav
            interactor.presenter = presenter
            
            return viewController
            
        }
        
        
        return UIViewController()
    }
}
