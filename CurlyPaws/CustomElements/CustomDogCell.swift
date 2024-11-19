//
//  CustomDogCell.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 14.11.24.
//

import UIKit

class CustomDogCell: UITableViewCell {
    
    private let customDogView = CustomDogView()
    
    var action: ((UITableViewCell) -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
        customDogView.buttonAction = {
            self.actionButtonTapped()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func actionButtonTapped() {
        action?(self)
    }
    
    func configure(dogModel: DogModel) {
        customDogView.configure(dogModel: dogModel)
    }
}

// MARK: - Setting
private extension CustomDogCell {
    func setup() {
        contentView.addSubview(customDogView)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        setupLayout()
    }
}

// MARK: - Layout
private extension CustomDogCell {
    func setupLayout() {
        customDogView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customDogView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customDogView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            customDogView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            customDogView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
