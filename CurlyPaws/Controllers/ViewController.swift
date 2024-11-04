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
    private let descriptionLabel = UILabel()
    private let stackView = UIStackView()
    
    private let lastButton = CustomButton(title: "Last", backgroundColor: .systemCyan, titleColor: .white, shouldHaveShadow: true)
    private let nextButton = CustomButton(title: "Next", backgroundColor: .white, titleColor: .black, shouldHaveShadow: true)
    private let firstButton = CustomButton(title: "First", backgroundColor: .systemPink, titleColor: .white, shouldHaveShadow: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let currentDog = dogDataManager?.getCurrentDog() else { return }
        
        if let touch = touches.first {
            let location = touch.location(in: view)
            
            if shadowView.frame.contains(location) {
                descriptionLabel.text = "This cute dog: \(currentDog.imageName)"
                descriptionLabel.isHidden = false
            } else {
                textLabel.text = "Meet this lovely dog: \(currentDog.imageName)"
            }
        }
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: - Update View
    private func updateView() {
        guard let currentDog = dogDataManager?.getCurrentDog() else { return }
        shadowView.updateImageName(imageName: currentDog.imageName)
        textLabel.text = currentDog.dogDescription
    }
}

// MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func pressedButton(_ button: CustomButton) {
        if button == lastButton {
            dogDataManager?.getLastDog()
        } else if button == nextButton {
            dogDataManager?.getNextDog()
        } else if button == firstButton {
            dogDataManager?.getFirstDog()
        }
        updateView()
        
        descriptionLabel.isHidden = true
    }
}

// MARK: - Setup View
private extension ViewController {
    func setupView() {
        view.backgroundColor = .white
        view.printViewNames(lastButton, nextButton, firstButton, shadowView)
        
        addSubViews()
        setupLabel()
        setupDescriptionLabel()
        setupStackView()
        setupButtons()
        updateView()
        setupLayout()
    }
    
    func addSubViews() {
        view.addSubview(shadowView)
        view.addSubview(textLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(stackView)
        view.addSubview(firstButton)
    }
    
    func setupButtons() {
        lastButton.delegate = self
        nextButton.delegate = self
        firstButton.delegate = self
        lastButton.buttonNameInstance = "Last Button"
        nextButton.buttonNameInstance = "Next Button"
        firstButton.buttonNameInstance = "First Button"
        shadowView.viewNameInstance = "Shadow View for Dog"
        
        print("Количество кнопок: \(view.countButtons(lastButton, nextButton, firstButton))")
    }
}

// MARK: - Setup View Elements
private extension ViewController {
   func setupLabel() {
        textLabel.numberOfLines = 0
        textLabel.font = .systemFont(ofSize: 16, weight: .regular)
        textLabel.textAlignment = .justified
        textLabel.textColor = .black
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .gray
        descriptionLabel.isHidden = true
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
        view.disableAutoresizingMasks(
            for: shadowView,
            textLabel,
            stackView,
            firstButton,
            descriptionLabel
        )
        
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
            
            descriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
