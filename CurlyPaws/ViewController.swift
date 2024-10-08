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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
     
        setupLabel()
        setupImageView()
        setupStackView()
        view.addSubview(stackView)
        
        setupLayout()
    }
    
    private func setupLabel() {
        textLabel.text = "jjj"
        textLabel.font = .systemFont(ofSize: 28, weight: .heavy)
        textLabel.textAlignment = .center
        textLabel.textColor = .black
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "toyPoodle")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 1
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        
    }
    
   private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
}
