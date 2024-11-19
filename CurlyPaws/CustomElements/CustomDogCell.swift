//
//  CustomDogCell.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 14.11.24.
//

import UIKit

class CustomDogCell: UITableViewCell {
    
    var action: ((UITableViewCell) -> ())?
    
    private let dogImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let markButton =  UIButton()
    
    private var toggleMark = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
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
        action?(self)
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
    private extension CustomDogCell {
        func setup() {
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
                contentView.addSubview(view)
            }
        }
    }
    
    // MARK: - Settings Views
    private extension CustomDogCell {
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
            markButton.tintColor = .systemCyan
        }
    }

// MARK: - Layout
private extension CustomDogCell {
    func setupLayout() {
        [dogImageView,
         titleLabel,
         descriptionLabel,
         markButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            dogImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dogImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: dogImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: markButton.leadingAnchor, constant: -8),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            markButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            markButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            markButton.widthAnchor.constraint(equalToConstant: 24),
            markButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
