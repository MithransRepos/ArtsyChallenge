//
//  UITabBarItemExtension.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarItem {
    
    static func with(icon: Icon, title: String? = nil) -> UITabBarItem{
        let barItem = UITabBarItem(title: title, image: icon.getImage.renderOriginal(), selectedImage: icon.getSelectedImage.renderOriginal())
        guard title == nil else { return barItem }
        barItem.ConfigNoText()
        return barItem
    }
    
    func ConfigNoText(){
        imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.clear], for: .selected)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.clear], for: .normal)
    }
}
