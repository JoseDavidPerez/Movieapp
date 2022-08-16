//
//  MenuOption.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation
import UIKit

enum MenuOptionEnum : String {
    
    case popular = "Popular"
    case top = "Top Rated"
    case tv = "On TV"
    case live = "Airing Today"
}

class MenuOption : UIView {
    
    var delegate : MenuOptionDelegate?
    
    var items : [MenuOptionEnum] = [.popular,.top,.tv,.live]
    
    var stackviewOption : UIStackView = {
      let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 1
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    func setupUI() {
        self.addSubview(stackviewOption)
        stackviewOption.frame = self.frame
        for item in items {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(item.rawValue, for: .normal)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 10
            button.titleLabel?.font = .systemFont(ofSize: 15)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor.hexStringToUIColor(hex: "#142024")
            button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
            stackviewOption.addArrangedSubview(button)
            
            
            
        }
        
    }
    
    func changeColorButton(){
        for view in stackviewOption.subviews {
            if let button = view as? UIButton {
                button.backgroundColor = UIColor.hexStringToUIColor(hex: "#142024")
            }
        }
    }
    
    @objc func clickButton(sender: UIButton) {
        self.changeColorButton()
        sender.backgroundColor = .darkGray
        let index = stackviewOption.subviews.firstIndex(of: sender)!
        delegate?.changeActive(status: items[index])
    }
    
}
protocol MenuOptionDelegate {
    func changeActive(status: MenuOptionEnum)
    
}
