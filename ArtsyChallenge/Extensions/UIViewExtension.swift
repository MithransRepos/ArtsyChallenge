//
//  UIView.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func width() -> CGFloat {
        return frame.size.width
    }

    func height() -> CGFloat {
        return frame.size.height
    }

    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setRounded() {
        if width() == 0 && height() == 0{
            layoutIfNeeded()
        }
        frame.size.width >= frame.size.height ? setRoundedByWidth() : setRoundedByHeight()
    }
    
    func setRoundedByHeight() {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
    
    func setRoundedByWidth() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }
}
