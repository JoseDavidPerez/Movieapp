//
//  CustomTextField.swift
//  MoviesApp
//
//  Created by osx on 13/08/22.
//

import Foundation
import UIKit

class CustomTextField : UITextField {
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        backgroundColor = UIColor.white
        layer.cornerRadius = 15
        layer.borderWidth = 2
        clipsToBounds = true
        layer.borderColor = UIColor.systemGray.cgColor
    }
    
    
}
