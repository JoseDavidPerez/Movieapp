//
//  MovieCollectionViewCell.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation
import UIKit

class MovieCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    
    var imagenview : UIImageView = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.contentMode = .scaleAspectFit
        imagen.layer.cornerRadius = 20
        imagen.layer.borderWidth = 2
        imagen.clipsToBounds = true
        return imagen
    }()
    
    var labeltitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
       return label
    }()
    
    var labeldate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 14)
       return label
    }()
    
    var labelrating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .green
       return label
    }()
    
    var imageStart : UIImageView = {
      var image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    var labelabout: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
       return label
    }()
    

    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "#142024")
        contentView.layer.cornerRadius = 20
        contentView.addSubview(imagenview)
        contentView.addSubview(labeltitle)
        contentView.addSubview(labeldate)
        contentView.addSubview(labelrating)
        contentView.addSubview(imageStart)
        contentView.addSubview(labelabout)
        contentView.clipsToBounds = true
        setupConstraint()
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setupConstraint(){
        
        NSLayoutConstraint.activate([
            
            imagenview.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagenview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagenview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagenview.heightAnchor.constraint(equalToConstant: 250),
            
            labeltitle.topAnchor.constraint(equalTo: imagenview.bottomAnchor, constant: 5),
            labeltitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labeltitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            
            labeldate.topAnchor.constraint(equalTo: labeltitle.bottomAnchor, constant: 10),
            labeldate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labeldate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            labelrating.topAnchor.constraint(equalTo: labeltitle.bottomAnchor, constant: 10),
            labelrating.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            imageStart.topAnchor.constraint(equalTo: labeltitle.bottomAnchor, constant: 10),
            imageStart.trailingAnchor.constraint(equalTo: labelrating.leadingAnchor, constant: -5),
            imageStart.heightAnchor.constraint(equalToConstant: 15),
            imageStart.widthAnchor.constraint(equalToConstant: 15),
            
            labelabout.topAnchor.constraint(equalTo: labeldate.bottomAnchor, constant: 20),
            labelabout.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelabout.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelabout.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
        ])
    }
    
    func setup(movie: MovieResponse){
        
        imagenview.downloadImage(form: movie.getUrl())
        labeltitle.text = movie.title
        labeldate.text = movie.date
        labelabout.text = movie.description
        labelrating.text = String(format: "%.1f", movie.rating)
        
    }
    
}
