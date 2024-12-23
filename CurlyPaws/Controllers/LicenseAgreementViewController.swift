//
//  LicenseAgreementViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 07.11.24.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    
    var textManager: ITextManageable?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let agreementTextLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

// MARK: - Setup View
private extension LicenseAgreementViewController {
    func setupView() {
        view.backgroundColor = UIColor(red: 0.80, green: 0.89, blue: 0.91, alpha: 1.0)
        addSubViews()
        
        setupScrollView()
        setupContentView()
        setupTitleLabel()
        setupAgreementTextLabel()
        setupLayout()
    }
    
    func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(agreementTextLabel)
    }
    
    func setupScrollView() {
        scrollView.backgroundColor = .white
        scrollView.layer.cornerRadius = 15
        scrollView.clipsToBounds = true
        scrollView.layer.borderWidth = 2
        scrollView.layer.borderColor = UIColor(red: 0.14, green: 0.26, blue: 0.37, alpha: 0.9).cgColor
        scrollView.alpha = 0.9
    }
    
    func setupContentView() {
            contentView.backgroundColor = .clear
        }
    
    func setupTitleLabel() {
        titleLabel.text = textManager?.getTitle()
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = UIColor(red: 0.14, green: 0.26, blue: 0.37, alpha: 1.0)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    
    func setupAgreementTextLabel() {
        agreementTextLabel.text = textManager?.getAgreementText()
        agreementTextLabel.font = UIFont.systemFont(ofSize: 16)
        agreementTextLabel.textColor = UIColor(red: 0.14, green: 0.26, blue: 0.37, alpha: 1.0)
        agreementTextLabel.numberOfLines = 0
    }
}

// MARK: - Setup Layout
extension LicenseAgreementViewController {
    private func setupLayout() {
        view.disableAutoresizingMasks(
            for: scrollView,
            contentView,
            titleLabel,
            agreementTextLabel
        )
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            
            agreementTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            agreementTextLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            agreementTextLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            agreementTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
