//
//  PanImageViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 06.11.24.
//

import UIKit

class PanImageViewController: UIViewController {
    
    var dogDataManager: DogDataManager?
    
    private let imageView = ShadowView(imageName: "toyPoodle")
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var topConstraint: NSLayoutConstraint!
    private var centerXConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - handlePanGesture
    @objc
    func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else {
            return
        }
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            topConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .cancelled, .ended:
            panGestureAnchorPoint = nil
        case .possible, .failed:
            break
        @unknown default:
            break
        }
    }
}

// MARK: - Setup View
private extension PanImageViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        
        setupImageView()
        setupLayout()
        setupGestureRecognizer()
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
    }
    
    func setupGestureRecognizer() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.maximumNumberOfTouches = 1
        
        imageView.addGestureRecognizer(panGestureRecognizer)
        }
}

// MARK: - Setup Layout
extension PanImageViewController  {
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = imageView.widthAnchor.constraint(
            equalToConstant: 200
        )
        let heightConstraint = imageView.heightAnchor.constraint(
            equalToConstant: 200
        )
        topConstraint = imageView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20
        )
        centerXConstraint = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            topConstraint,
            centerXConstraint
        
        ])
    }
}

