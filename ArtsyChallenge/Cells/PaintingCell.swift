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

    private let priceLabel: UILabel = ViewHelper.getLabel()

    private let authorLabel: UILabel = ViewHelper.getLabel()

    private let locationLabel: UILabel = ViewHelper.getLabel()

    private let agencyLabel: UILabel = ViewHelper.getLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyle()
    }

    private func addViews() {
        addSubview(paintingImageView)
        addSubview(priceLabel)
        addSubview(authorLabel)
        addSubview(locationLabel)
        addSubview(agencyLabel)
    }

    private func addConstraints() {
        paintingImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        priceLabel.anchor(top: paintingImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, height: 20)
        authorLabel.anchor(top: priceLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 20)
        locationLabel.anchor(top: authorLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 20)
        agencyLabel.anchor(top: locationLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingBottom: 5, height: 20)
    }

    private func setStyle() {
        priceLabel.font = UIFont.arial(ofSize: 20)
        authorLabel.font = UIFont.baskerville(ofSize: 14)
        locationLabel.font = UIFont.baskerville(ofSize: 14).italic
        agencyLabel.font = UIFont.arial(ofSize: 12)

        priceLabel.textColor = .black
        authorLabel.textColor = .black
        locationLabel.textColor = .lightBlack
        agencyLabel.textColor = .gray
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell(row: Int = 0) {
        paintingImageView.setImage(imageUrl: "https://picsum.photos/200/300")
        paintingImageView.anchor(height: row.isEven ? 150 : 250)
        priceLabel.text = "$6,500"
        authorLabel.text = "Pablo Picasso"
        locationLabel.text = "Le crapaud, 1949"
        agencyLabel.text = "ArtRite"
    }
}
