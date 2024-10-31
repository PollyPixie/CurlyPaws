//
//  UIView+Constraints.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 31.10.24.
//

import UIKit

extension UIView {
    func disableAutoresizingMasks(for views: UIView...) {
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
