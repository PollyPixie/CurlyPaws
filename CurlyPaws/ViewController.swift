//
//  ViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let textLabel = UILabel()
    
    
    private let dogDataManager = DogDataManager(dogs: DogManager().getDogs())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupImageView()
        setupLabel()
        view.addSubview(imageView)
        view.addSubview(textLabel)
        
        setupLayout()
        
        updateView()
    }
    
    private func updateView() {
        let currentDog = dogDataManager.getCurrentDog()
        
        imageView.image = UIImage(named: currentDog.imageName)
        textLabel.text = currentDog.description
    }
}

// MARK: - Setup View
private extension ViewController {
    func setupImageView() {
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
    
    func setupLabel() {
        textLabel.numberOfLines = 0
        textLabel.font = .systemFont(ofSize: 14, weight: .regular)
        textLabel.textAlignment = .justified
        textLabel.textColor = .black
    }
}
// MARK: - Setup Layout
extension ViewController {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    }
}
