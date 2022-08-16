//
//  MenuView.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation
import UIKit

internal class MenuView : BaseViewController {
    
    public var presenter : MenuPresenter?
    
    var collectionView: UICollectionView?
    var movieData: [MovieResponse] = []
    
    var menuOption: MenuOption = {
        let menu = MenuOption()
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.setupUI()
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuOption.delegate = self
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 1
        
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4, height: 400)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        view.addSubview(menuOption)
        //collectionView.frame = view.bounds
        //view.backgroundColor = .black
        collectionView.backgroundColor = .black
        self.presenter?.getRaking()
        setupConstraint()
        title = "TV Shows"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(goToProfile))
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "list.bullet")
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            
            menuOption.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            menuOption.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            menuOption.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            menuOption.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView!.topAnchor.constraint(equalTo: menuOption.bottomAnchor),
            collectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func goToProfile(){
        
        let alert = UIAlertController(title: "What do you want to do?", message: "",
                                       preferredStyle: .actionSheet)

        
        let profile = UIAlertAction(title: "View Profile",
                                         style: .default,
                                         handler: {_ in
            self.presenter?.goToProfile()
        })

        let logout = UIAlertAction(title: "Log out",
                                          style: .default,
                                          handler: {_ in
            self.navigationController?.popViewController(animated: true)
        })

        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel,
                                         handler: nil)

        alert.addAction(profile)
        alert.addAction(logout)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension MenuView : MenuViewProtocol {
    
    func loading(show: Bool) {
        if show {
            self.createSpinner()
        }else {
            self.removeSpinner()
        }
    }
    
    func error(text: String) {
        
    }
    
    func reloadData(data: [MovieResponse]) {
        print(data.count)
        self.movieData = data
        collectionView?.reloadData()
    }
    
    
    
    
}
extension MenuView : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.setup(movie: movieData[indexPath.row])
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.showDetailMovie(movie: movieData[indexPath.row])
    }

}
extension MenuView : MenuOptionDelegate {
    
    func changeActive(status: MenuOptionEnum) {
        presenter?.getMovies(type: status)
    }
    
    
}
