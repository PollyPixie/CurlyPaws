//
//  UIView+print.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 25.10.24.
//

import UIKit

extension UIView {
    func countButtons(_ views: UIView...) -> Int {
        var buttonCount = 0
        
        for view in views {
            if view is UIButton {
                buttonCount += 1
            }
        }
       return buttonCount
    }
    
    func printViewNames(_ views: UIView...) {
        for view in views {
            if let button = view as? CustomButton {
                print(button.buttonNameInstance ?? "Unnamed button")
            } else if let shadowView = view as? ShadowView {
                print(shadowView.viewNameInstance ?? "Unnamed view")
            } else {
                print("Unknown view")
            }
        }
    }
}
