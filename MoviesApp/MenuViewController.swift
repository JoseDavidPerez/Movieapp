//
//  MenuViewController.swift
//  MoviesApp
//
//  Created by osx on 12/08/22.
//

import UIKit

class MenuViewController: UIViewController {

    override func loadView() {
        let view = UIView()
        self.view = view
        self.view.backgroundColor = .blue
    }
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.addArrangedSubview(plainViewControllerButton)
        sv.addArrangedSubview(subclassedViewButton)
        return sv
    }()
    
    lazy var plainViewControllerButton: UIButton = {
       let bt = UIButton()
        bt.setTitle("TV SHOW", for: .normal)
        bt.addTarget(self, action: #selector(goPlain), for: .touchDown)
        return bt
    }()
    
    lazy var subclassedViewButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Subclassed ViewController", for: .normal)
        bt.addTarget(self, action: #selector(goSubclass), for: .touchDown)
        return bt
    }()
    
    @objc func goPlain(){
        self.navigationController?.pushViewController(ViewController(), animated: true)
        
    }
    @objc func goSubclass(){
        self.navigationController?.pushViewController(ViewControllerSubClassedCell(), animated: true)
    }
    func addConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        view.addSubview(stackView)
        addConstraints()
        
    }
}
