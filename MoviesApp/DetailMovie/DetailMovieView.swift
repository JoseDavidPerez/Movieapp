//
//  DetailMovieVIew.swift
//  MoviesApp
//
//  Created by osx on 15/08/22.
//

import Foundation
import UIKit

class DetailMovieView : UIViewController{
    
    var presenter: DetailMoviePresenter?
    var movieData: MovieResponse?
    
    var imagenview : UIImageView = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.contentMode = .scaleAspectFill
        return imagen
    }()
    
    var labeltitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 20)
       return label
    }()
    
    var labelLanguageTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.text = "Idioma :"
        label.font = UIFont.boldSystemFont(ofSize: 20)
       return label
    }()
    
    var labelpopularity: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        return label
    }()
    
    var labelvote: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        return label
    }()
    
    var labellanguage: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        return label
    }()
    
    var labeldate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
       return label
    }()
    
    var labelrating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
       return label
    }()
    
    var imageStar : UIImageView = {
      var image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    var imageHand : UIImageView = {
      var image = UIImageView()
        image.image = UIImage(systemName: "hand.thumbsup.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    var imagePerson : UIImageView = {
      var image = UIImageView()
        image.image = UIImage(systemName: "person.3.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    var labelabout: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .justified
       return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIU()
        setupConstraint()
        setup(movie: movieData!)
    }
    
    func setupIU(){
        view.addSubview(imagenview)
        view.addSubview(imageStar)
        view.addSubview(imageHand)
        view.addSubview(imagePerson)
        view.addSubview(labeltitle)
        view.addSubview(labelLanguageTitle)
        view.addSubview(labelpopularity)
        view.addSubview(labelvote)
        view.addSubview(labelrating)
        view.addSubview(labelabout)
        view.addSubview(labellanguage)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            
            imagenview.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imagenview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            imagenview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            imagenview.heightAnchor.constraint(equalToConstant: 250),
            
            labeltitle.topAnchor.constraint(equalTo: imagenview.bottomAnchor, constant: 20),
            labeltitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labeltitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelrating.topAnchor.constraint(equalTo: imagenview.bottomAnchor, constant: 20),
            labelrating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imageStar.topAnchor.constraint(equalTo: imagenview.bottomAnchor, constant: 20),
            imageStar.trailingAnchor.constraint(equalTo: labelrating.leadingAnchor, constant: -15),
            
            labelpopularity.topAnchor.constraint(equalTo: labelrating.bottomAnchor, constant: 10),
            labelpopularity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imageHand.topAnchor.constraint(equalTo: imageStar.bottomAnchor, constant: 10),
            imageHand.trailingAnchor.constraint(equalTo: labelpopularity.leadingAnchor, constant: -15),
            
            labelvote.topAnchor.constraint(equalTo: labelpopularity.bottomAnchor, constant: 10),
            labelvote.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imagePerson.topAnchor.constraint(equalTo: imageHand.bottomAnchor, constant: 10),
            imagePerson.trailingAnchor.constraint(equalTo: labelvote.leadingAnchor, constant: -15),
            
            labelLanguageTitle.topAnchor.constraint(equalTo: labeltitle.bottomAnchor, constant: 20),
            labelLanguageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            labellanguage.topAnchor.constraint(equalTo: labeltitle.bottomAnchor, constant: 20),
            labellanguage.leadingAnchor.constraint(equalTo: labelLanguageTitle.trailingAnchor, constant: 5),
            
            labelabout.topAnchor.constraint(equalTo: imageHand.bottomAnchor, constant: 50),
            labelabout.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelabout.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
            
            
            
            
      
        ])
    }
    
    func setup(movie: MovieResponse){
        
        imagenview.downloadImage(form: movie.getUrl())
        labeltitle.text = movie.title
        labeldate.text = movie.date
        labellanguage.text = movie.lenguage
        labelpopularity.text = String(format: "%.1f", movie.popularity)
        labelvote.text = "\(movie.vote)"
        labelabout.text = movie.description
        labelrating.text = String(format: "%.1f", movie.rating)
       
     
        
        
    }
    
    
}
extension DetailMovieView: DetailMovieViewProtocol {
    

}
