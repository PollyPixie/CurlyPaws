//
//  CustomDogView.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 20.11.24.
//

import UIKit

class CustomDogView: UIView {
    
    var buttonAction: (() -> ())?
    
    private let dogImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let markButton =  UIButton()
    private var toggleMark = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = .white
        } completion: { _ in
            self.backgroundColor = UIColor(
                cgColor: CGColor(red: 124/255, green: 169/255, blue: 104/255, alpha: 0.8)
            )
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func actionButtonTapped() {
        toggleMark.toggle()
        let mark = toggleMark ? "checkmark.square.fill" : "checkmark.square"
        markButton.setImage(UIImage(systemName: mark), for: .normal)
        
        buttonAction?()
    }
    
    func configure(dogModel: DogModel) {
        dogImageView.image = UIImage(named: dogModel.imageName)
        titleLabel.text = dogModel.imageName
        descriptionLabel.text = dogModel.dogDescription
        toggleMark = dogModel.isMark
        
        let mark = dogModel.isMark ? "checkmark.square.fill" : "checkmark.square"
        markButton.setImage(UIImage(systemName: mark), for: .normal)
        
        markButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Setting
private extension CustomDogView {
    func setup() {
        backgroundColor = UIColor(cgColor: CGColor(red: 124/255, green: 169/255, blue: 104/255, alpha: 0.8))
        layer.cornerRadius = 20
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 5
        
        addSubViews()
        setupDogImageView()
        setupTitleLabel()
        setupDescription()
        setupMarkButton()
        setupLayout()
    }
    
    func addSubViews() {
        [dogImageView,
         titleLabel,
         descriptionLabel,
         markButton].forEach { view in
            addSubview(view)
        }
    }
}
    
    // MARK: - Settings Views
private extension CustomDogView {
    func setupDogImageView() {
        dogImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dogImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        dogImageView.contentMode = .scaleAspectFill
    }
    
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupDescription() {
        descriptionLabel.numberOfLines = 0
    }
    
    func setupMarkButton() {
        markButton.tintColor = UIColor(cgColor: CGColor(red: 255/255, green: 255/255, blue: 51/255, alpha: 1))
    }
}

// MARK: - Layout
private extension CustomDogView {
    func setupLayout() {
        [dogImageView,
         titleLabel,
         descriptionLabel,
         markButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let bottomConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        bottomConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dogImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            dogImageView.widthAnchor.constraint(equalToConstant: 100),
            dogImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: dogImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: markButton.leadingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bottomConstraint,
            
            markButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            markButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            markButton.widthAnchor.constraint(equalToConstant: 24),
            markButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
