//
//  UIImageExtension.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit

enum Icon: String {
    case home = "home"
    case map = "map"
    
    var getImage: UIImage{
        return UIImage(named: rawValue) ?? UIImage()
    }
    var getSelectedImage: UIImage{
        return UIImage(named: "\(rawValue)-selected") ?? UIImage()
    }
}


extension UIImage{
    
    
    func renderOriginal() -> UIImage{
        return withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
}
