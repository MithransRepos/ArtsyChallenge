//
//  UIImageExtension.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

enum Icon: String {
    case home
    case map

    var getImage: UIImage {
        return UIImage(named: rawValue) ?? UIImage()
    }

    var getSelectedImage: UIImage {
        return UIImage(named: "\(rawValue)-selected") ?? UIImage()
    }
}

extension UIImage {
    func renderOriginal() -> UIImage {
        return withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }

    func filled(with color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(CGBlendMode.normal)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        guard let mask = self.cgImage else { return self }
        context.clip(to: rect, mask: mask)
        context.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    static let pin = UIImage(named: "pin")?.filled(with: .green)
    static let pin2 = UIImage(named: "pin2")?.filled(with: .green)
    static let me = UIImage(named: "me")?.filled(with: .blue)
}

extension UIImageView {
    func setImage(imageUrl: String?) {
        kf.setImage(with: URL(string: imageUrl ?? ""))
    }

    func setAvatarImage(imageUrl: String?) {
        setRounded()
        setImage(imageUrl: imageUrl)
    }
}
