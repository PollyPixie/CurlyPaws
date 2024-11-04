//
//  FindImageViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 04.11.24.
//

import UIKit

class FindImageViewController: UIViewController {
    
    var dogDataManager: DogDataManager?
    
    private let label = UILabel()
    private let textField = UITextField()
    private let button = CustomButton(title: "Проверить", backgroundColor: .white, titleColor: .systemBlue, shouldHaveShadow: false)
    
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        checkImage()
        
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: - Show Text
    private func showText(_ message: String) {
        label.text = message
    }

    // MARK: - Check Image
    private func checkImage() {
        guard let imageName = textField.text, !imageName.isEmpty else {
            return
        }
        
        if let dogModel = dogDataManager?.findImage(by: imageName) {
            showText("Такая картинка есть")
            imageView.image = UIImage(named: dogModel.imageName)
            descriptionLabel.text = dogModel.description
        } else {
            showText("Такой картинки нет")
            imageView.image = nil
            descriptionLabel.text = ""
        }
        
        textField.text = ""
        textField.resignFirstResponder()
    }
}
    
// MARK: - ICustomButtonDelegate
extension FindImageViewController: ICustomButtonDelegate {
    func pressedButton(_ button: CustomButton) {
        checkImage()
    }
}

// MARK: - UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkImage()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkImage()
    }
}

// MARK: - Setup View
private extension FindImageViewController {
    func setupView() {
        view.backgroundColor = .white
        
        addSubViews()
        
        button.delegate = self
        textField.delegate = self
        
        setupLabel()
        setupTextField()
        setupImageView()
        setupDescriptionLabel()
        setupLayout()
    }
    
    func addSubViews() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
    }
}

// MARK: - Setup View Elements
private extension FindImageViewController {
        
        func setupLabel() {
            label.text = "Введите название картинки"
            label.textAlignment = .center
        }
        
        func setupTextField() {
            textField.placeholder = "Название картинки"
            textField.borderStyle = .roundedRect
        }
    
    func setupImageView() {
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
        }
        
        func setupDescriptionLabel() {
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .center
        }
    }

// MARK: - Setup Layout
extension FindImageViewController {
    private func setupLayout() {
        view.disableAutoresizingMasks(
            for: label,
            textField,
            button,
            imageView,
            descriptionLabel
        )
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 80),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
        
            imageView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }
}
