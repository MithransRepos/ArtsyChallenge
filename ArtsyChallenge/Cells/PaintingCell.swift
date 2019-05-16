//
//  PaitingCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class PaitingCell: UICollectionViewCell {
    static let identifier = "PaintingCell"

    private let paintingImageView: UIImageView = ViewHelper.getImageView()

    private let authorLabel: UILabel = ViewHelper.getLabel()

    private let priceLabel: UILabel = ViewHelper.getLabel()

    private let infoLabel: UILabel = ViewHelper.getLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

    private func addViews() {
        addSubview(paintingImageView)
        addSubview(authorLabel)
        addSubview(priceLabel)
        addSubview(infoLabel)
        addConstraints()
    }

    private func addConstraints() {
        paintingImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        priceLabel.anchor(top: paintingImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, height: 22)
        authorLabel.anchor(top: priceLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, height: 22)
        infoLabel.anchor(top: authorLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingBottom: 5)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell() {
        paintingImageView.setImage(imageUrl: "https://picsum.photos/200/300")
        priceLabel.text = "$12000"
        authorLabel.text = "Frank Stella"
        infoLabel.text = "East Euralia, from imaginary places, 1995"
    }
}