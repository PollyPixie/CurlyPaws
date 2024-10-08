//
//  ViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let imageView = UIImageView()
    private let stackView = UIStackView()
    
    private let dogDataManager = DogDataManager(dogs: DogManager().getDogs())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLabel()
        setupImageView()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
        
        updateView()
    }
    
    private func updateView() {
        let currentDog = dogDataManager.getCurrentDog()
        
        textLabel.text = currentDog.description
        imageView.image = UIImage(named: currentDog.imageName)
    }
}
    
// MARK: - Setup View
private extension ViewController {
    func setupLabel() {
        textLabel.numberOfLines = 0
        textLabel.font = .systemFont(ofSize: 14, weight: .regular)
        textLabel.textAlignment = .center
        textLabel.textColor = .black
    }
    
    func setupImageView() {
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
       stackView.spacing = 20
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        
    }
}
    // MARK: - Setup Layout
extension ViewController {
   func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
           stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
       ])
    }
}
