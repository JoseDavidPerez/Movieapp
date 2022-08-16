//
//  BaseViewController.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var viewspinner : UIView = UIView()

    func createSpinner() {
        
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        viewspinner.backgroundColor = UIColor(white: 0, alpha: 0.7)
        viewspinner.frame = view.frame
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        viewspinner.addSubview(spinner)
        view.addSubview(viewspinner)
        spinner.centerXAnchor.constraint(equalTo: viewspinner.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: viewspinner.centerYAnchor).isActive = true
    }
    
    func removeSpinner() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            self.viewspinner.removeFromSuperview()
        }
    }
}
