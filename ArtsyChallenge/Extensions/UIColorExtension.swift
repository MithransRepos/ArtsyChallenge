//
//  UIColorExtensions.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0 ... 1),
                       green: .random(in: 0 ... 1),
                       blue: .random(in: 0 ... 1),
                       alpha: 1.0)
    }
}
