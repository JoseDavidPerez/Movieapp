//
//  DetailProfile.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation
import UIKit

class DetailProfileView : UIViewController{
    
    
    var imageview : UIImageView = {
      let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "userprofileblack")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var labeluser : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "davidAjolote"
        label.textColor = .green
        return label
    }()
    
    var labelTitle : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.textColor = .darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        
    }

    func setupUI(){
        view.addSubview(imageview)
        view.addSubview(labeluser)
        view.addSubview(labelTitle)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            
            labelTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imageview.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 35),
            imageview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageview.heightAnchor.constraint(equalToConstant: 100),
            imageview.widthAnchor.constraint(equalToConstant: 100),
            
            labeluser.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 65),
            labeluser.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 20)
            
            
        ])
    }
}

