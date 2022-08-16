//
//  DetailProfileRouter.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation
import UIKit

internal class DetailProfileRouter {
    
    public var navigation : UINavigationController?
}
    
    
extension DetailProfileRouter: DetailProfileRouterProtocol {
    
    public static func createModule(navigation: UINavigationController?) -> UIViewController {
        
        let viewController : DetailProfileView = DetailProfileView()
        
        if let nav = navigation {

            return viewController
        }
        
        return UIViewController()
        
    }
}
