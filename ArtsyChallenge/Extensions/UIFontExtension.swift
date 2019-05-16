//
//  UIFontExtension.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    var bold: UIFont {
        return with(.traitBold)
    } // bold

    var italic: UIFont {
        return with(.traitItalic)
    } // italic

    var boldItalic: UIFont {
        return with([.traitBold, .traitItalic])
    } // boldItalic

    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }

    static func arial(ofSize size: CGFloat, type: FontType = .regular) -> UIFont {
        return customFont(name: "ArialHebrew\(type.rawValue)", size: size)
    }
    
    static func baskerville(ofSize size: CGFloat, type: FontType = .regular) -> UIFont {
        return customFont(name: "Baskerville\(type.rawValue)", size: size)
    }
    
}
