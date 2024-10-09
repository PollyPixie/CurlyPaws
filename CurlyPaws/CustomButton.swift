//
//  CustomButton.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 09.10.24.
//
import UIKit

// Custom Button Class
class CustomButton: UIButton {
    private var shouldHaveShadow: Bool
    
    init(title: String, backgroundColor: UIColor, titleColor: UIColor, shouldHaveShadow: Bool) {
        self.shouldHaveShadow = shouldHaveShadow
        super.init(frame: .zero)
        setupButton(title: title, backgroundColor: backgroundColor, titleColor: titleColor)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if shouldHaveShadow {
            let shadowPath = UIBezierPath(rect: bounds)
            layer.shadowPath = shadowPath.cgPath
        }
    }
}

// MARK: - Setup Button
extension CustomButton {
    private func setupButton(title: String, backgroundColor: UIColor, titleColor: UIColor) {
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = Constants.cornerRadius
        titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        if shouldHaveShadow {
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 10)
            layer.shadowOpacity = Constants.shadowOpacity
            layer.shadowRadius = Constants.shadowRadius
        }
    }
}

// MARK: - Constants
extension CustomButton {
    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let shadowOpacity: Float = 0.7
        static let shadowRadius: CGFloat = 10
    }
}
