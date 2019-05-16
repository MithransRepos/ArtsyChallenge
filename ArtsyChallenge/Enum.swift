//
//  Enum.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit

enum FlowLayoutType {
    case horizontal
    case vertical
    case pinterest

    func getLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = self == .horizontal ? UICollectionView.ScrollDirection.horizontal : UICollectionView.ScrollDirection.vertical
        return layout
    }
}

enum FontType: String {
    case regular = ""
    case bold = "-Bold"
    case light = "-Light"
}
