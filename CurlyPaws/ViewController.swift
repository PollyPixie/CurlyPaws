//
//  ViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let dogDataManager = DogDataManager(dogs: DogManager().getDogs())
    
    private let imageView = UIImageView()
    private let textLabel = UILabel()
    private let stackView = UIStackView()
    
    private let lastButton = CustomButton(title: "Last", backgroundColor: .systemCyan, titleColor: .white, shouldHaveShadow: true)
    private let nextButton = CustomButton(title: "Next", backgroundColor: .white, titleColor: .black, shouldHaveShadow: true)
    private let firstButton = CustomButton(title: "First", backgroundColor: .systemPink, titleColor: .white, shouldHaveShadow: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(textLabel)
        view.addSubview(stackView)
        view.addSubview(firstButton)
        
        setupImageView()
        setupLabel()
        setupStackView()
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
        textLabel.font = .systemFont(ofSize: 16, weight: .regular)
        textLabel.textAlignment = .justified
        textLabel.textColor = .black
    }
    
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 40
        
        stackView.addArrangedSubview(lastButton)
        stackView.addArrangedSubview(nextButton)
    }
    
}
// MARK: - Setup Layout
extension ViewController {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            stackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 70),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 100),
            firstButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
