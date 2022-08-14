//
//  MenuView.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation
import UIKit

internal class MenuView : UIViewController {
    
    public var presenter : MenuPresenter?
    
    
    var imagenview : UIImageView = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.image = UIImage(named: "moviedb")
        imagen.contentMode = .scaleAspectFit
        return imagen
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imagenview)
    }
    
    func setupConstraint(){
        NSLayoutConstraint.activate([
            imagenview.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            imagenview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imagenview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        ])
    }
}

extension MenuView : MenuViewProtocol {
    
    
    
}
