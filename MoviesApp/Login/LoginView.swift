//
//  View.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation
import UIKit

class LoginView : UIViewController, UITextFieldDelegate {
    
    var presenter : LoginPresenter?
    
    var imagenview : UIImageView = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.image = UIImage(named: "moviedb")
        imagen.contentMode = .scaleAspectFit
        return imagen
    }()
    
    var labeltitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Titulo"
        label.textColor = .green
       return label
    }()
    
    var labeldate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jun 17, 2021"
        label.textColor = .green
       return label
    }()
    
    var labelrating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8.0"
        label.textColor = .green
       return label
    }()
    
    var labelabout: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen."
        label.numberOfLines = 0
        label.textColor = .white
       return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponets()
        setupConstraint()
        
    }
    

    
    @objc func loginAction (sender: AnyObject){
        self.presenter?.notifyMenu(navegation: self.navigationController!)
        
    }
    
    func setupComponets(){
        
        view.addSubview(imagenview)
        view.addSubview(labeltitle)
        view.addSubview(labeldate)
        view.addSubview(labelabout)
    }
    
    func setupConstraint(){
        
        NSLayoutConstraint.activate([
            
            imagenview.topAnchor.constraint(equalTo: view.topAnchor),
            imagenview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagenview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            labeltitle.topAnchor.constraint(equalTo: imagenview.bottomAnchor, constant: 20),
            labeltitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labeltitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            
            labeldate.topAnchor.constraint(equalTo: labeltitle.bottomAnchor, constant: 30),
            labeldate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labeldate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelabout.topAnchor.constraint(equalTo: labeldate.bottomAnchor, constant: 20),
            labelabout.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelabout.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelabout.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            
        ])
    }
    
}

extension LoginView : UITextViewDelegate {
    
    

}

extension LoginView : LoginViewProtocol {
    
}
