//
//  ViewController.swift
//  MoviesApp
//
//  Created by osx on 12/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green, UIColor.red, UIColor.green, UIColor.blue, UIColor.green, UIColor.purple, UIColor.orange, UIColor.blue, UIColor.green, UIColor.blue, UIColor.green]
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
    }
    
    override func loadView() {
        
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view = collectionView
        
    }

}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row\(collectionView.tag) selected index path \(indexPath)")
    }
    
}

extension ViewController: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let data = self.data[indexPath.item]
        cell.backgroundColor = data
        return cell
    }
}
