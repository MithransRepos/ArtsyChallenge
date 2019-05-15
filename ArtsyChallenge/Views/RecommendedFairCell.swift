//
//  RecommendedFairCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class RecommendedFairCell: UICollectionViewCell {
    static let identifier = "RecommendedFairCell"
    
    let fairImageView: UIImageView = ViewHelper.getImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    private func addViews() {
        addSubview(fairImageView)
        addConstraints()
    }
    
    private func addConstraints() {
        fairImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, width: 100, height: 100)
       
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell() {
        fairImageView.setRounded()
        fairImageView.setImage(imageUrl: "https://picsum.photos/200/300/?blur")
    }
}
