//
//  View.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation
import UIKit

class LoginView : BaseViewController, UITextFieldDelegate {
    
    
    var presenter : LoginPresenter?
    
    var imagenview : UIImageView = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.image = UIImage(named: "moviedb")
        imagen.contentMode = .scaleAspectFit
        return imagen
    }()
    
    var usertext: CustomTextField =  {
       let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        //text.placeholder = "Username"
        text.backgroundColor = .white
        text.text = "davidAjolote"
        return text
    }()
    
    var passwordtext: CustomTextField = {
       let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Password"
        text.backgroundColor = .white
        text.text = "55518395xENA"
        return text
    }()
    
    var logininbotton: UIButton = {
        let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle("Log in", for: .normal)
        botton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        botton.backgroundColor = .lightGray
       return botton
    }()
    
    lazy var labelerror: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 2
       return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupComponets()
        setupConstraint()
        
        
    }
    
    func setDelegates(){
        
        usertext.delegate = self
        passwordtext.delegate = self
    }
    
    @objc func loginAction (sender: AnyObject){
        self.presenter?.login(username: usertext.text, password: passwordtext.text)
        
    }
    
    func setupComponets(){
        view.addSubview(imagenview)
        view.addSubview(usertext)
        view.addSubview(passwordtext)
        view.addSubview(logininbotton)
        view.addSubview(labelerror)
    }
    
    func setupConstraint(){
        
        NSLayoutConstraint.activate([
            
            imagenview.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imagenview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imagenview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imagenview.heightAnchor.constraint(equalToConstant: 100),
            imagenview.widthAnchor.constraint(equalToConstant: 100),
            
            usertext.topAnchor.constraint(equalTo: imagenview.bottomAnchor, constant: 20),
            usertext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usertext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usertext.heightAnchor.constraint(equalToConstant: 50),
            
            passwordtext.topAnchor.constraint(equalTo: usertext.bottomAnchor, constant: 20),
            passwordtext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordtext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordtext.heightAnchor.constraint(equalToConstant: 50),
            
            logininbotton.topAnchor.constraint(equalTo: passwordtext.bottomAnchor, constant: 20),
            logininbotton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logininbotton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logininbotton.heightAnchor.constraint(equalToConstant: 50),
            
            labelerror.topAnchor.constraint(equalTo: logininbotton.bottomAnchor, constant: 15),
            labelerror.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            labelerror.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            
        ])
    }
    
}

extension LoginView : UITextViewDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        usertext.resignFirstResponder()
        passwordtext.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        labelerror.text = ""
    }
}

extension LoginView : LoginViewProtocol {
    
    
    
    func loading(show: Bool) {
        if show {
            self.createSpinner()
        }else {
            self.removeSpinner()
        }
    }
    
    func error(text: String) {
        labelerror.text = "Invalid username and/or password: You did not provide a valid login."
        labelerror.textColor = .red
    }
    
    
}
