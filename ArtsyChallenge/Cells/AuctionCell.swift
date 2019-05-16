//
//  AuctionCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class AuctionCell: UICollectionViewCell {
    static let identifier = "AuctionCell"

    
    private let paintingImageView: UIImageView = ViewHelper.getImageView()

    private let authorLabel: UILabel = ViewHelper.getLabel()

    private let liveLabel: UILabel = ViewHelper.getLabel()

    private let infoLabel: UILabel = ViewHelper.getLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyle()
    }

    private func addViews() {
        addSubview(paintingImageView)
        addSubview(authorLabel)
        addSubview(liveLabel)
        addSubview(infoLabel)
    }

    private func setStyle() {
        authorLabel.textColor = .white
        liveLabel.backgroundColor = .white
        infoLabel.textColor = .white
        liveLabel.textColor = .black
        liveLabel.textAlignment = .center
        liveLabel.font = UIFont.arial(ofSize: 9).bold
        authorLabel.font = UIFont.baskerville(ofSize: 16)
        infoLabel.font = UIFont.arial(ofSize: 12)
        authorLabel.backgroundColor = .transparentBlack
    }

    private func addConstraints() {
        paintingImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 250)
        liveLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 10, paddingRight: 5, width: 30, height: 15)
        authorLabel.anchor(top: topAnchor, left: leftAnchor, right: liveLabel.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 5)
        infoLabel.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 10, paddingBottom: -5)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell() {
        paintingImageView.setImage(imageUrl: "https://picsum.photos/200/300")
        authorLabel.text = "Frank Stella"
        infoLabel.text = "LIVE NOW"
        liveLabel.text = "LIVE"
    }
}
