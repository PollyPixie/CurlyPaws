//
//  ViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    var dogDataManager: DogDataManageable?
   
    private let shadowView = ShadowView(imageName: "toyPoodle")
    private let textLabel = UILabel()
    private let stackView = UIStackView()
    
    private let lastButton = CustomButton(title: "Last", backgroundColor: .systemCyan, titleColor: .white, shouldHaveShadow: true)
    private let nextButton = CustomButton(title: "Next", backgroundColor: .white, titleColor: .black, shouldHaveShadow: true)
    private let firstButton = CustomButton(title: "First", backgroundColor: .systemPink, titleColor: .white, shouldHaveShadow: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(shadowView)
        view.addSubview(textLabel)
        view.addSubview(stackView)
        view.addSubview(firstButton)
        setupLabel()
        setupStackView()
        updateView()
        addAction()
        setupLayout()
    }
    
    private func updateView() {
        guard let currentDog = dogDataManager?.getCurrentDog() else { return }
        shadowView.updateImageName(imageName: currentDog.imageName)
        textLabel.text = currentDog.dogDescription
    }
}

// MARK: - Setup Action
extension ViewController {
    private func addAction() {
        let lastAction = UIAction { _ in
            self.dogDataManager?.getLastDog()
            self.updateView()
        }
        lastButton.addAction(lastAction, for: .touchUpInside)
        
        let nextAction = UIAction { _ in
            self.dogDataManager?.getNextDog()
            self.updateView()
        }
        nextButton.addAction(nextAction, for: .touchUpInside)
        
        let firstAction = UIAction { _ in
            self.dogDataManager?.getFirstDog()
            self.updateView()
        }
        firstButton.addAction(firstAction, for: .touchUpInside)
    }
}

// MARK: - Setup View
private extension ViewController {
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
    private func setupLayout() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            shadowView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            shadowView.heightAnchor.constraint(equalTo: shadowView.widthAnchor),
            
            textLabel.topAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            textLabel.heightAnchor.constraint(equalToConstant: 100),
            
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
