//
//  ShadowView.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 11.10.24.
//

import UIKit

class ShadowView: UIView {
    var viewNameInstance: String?
    
    private let imageView = UIImageView()
    
    init(imageName: String) {
        super.init(frame: .zero)
        setupView()
        setupImageView(imageName: imageName)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
    
    func updateImageName(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

    // MARK: - Setup View
    extension ShadowView {
        private func setupImageView(imageName: String) {
            imageView.image = UIImage(named: imageName)
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            
            addSubview(imageView)
        }
        
        private func setupView() {
            layer.cornerRadius = Constants.cornerRadius
            layer.shadowColor = Constants.shadowColor
            layer.shadowOpacity = Constants.shadowOpacity
            layer.shadowOffset = Constants.shadowOffset
            layer.shadowRadius = Constants.shadowRadius
        }
        
        private func setupLayout() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: self.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
    }
