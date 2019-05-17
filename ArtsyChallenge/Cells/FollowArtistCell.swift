//
//  FollowArtistCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class FollowArtistCell: UICollectionViewCell {
    static let identifier = "FollowArtistCell"

    private let borderView: UIView = ViewHelper.getView()

    private let paintingImageView: UIImageView = ViewHelper.getImageView()

    private let artistLabel: UILabel = ViewHelper.getLabel()

    private let artistLocationLabel: UILabel = ViewHelper.getLabel()

    private let infoLabel: UILabel = ViewHelper.getLabel()

    private let followButton: UIButton = ViewHelper.getButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyle()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(borderView)
        addSubview(paintingImageView)
        addSubview(artistLabel)
        addSubview(artistLocationLabel)
        addSubview(infoLabel)
        addSubview(followButton)
    }

    private func setStyle() {
        borderView.layer.borderWidth = 0.5
        borderView.layer.borderColor = UIColor.lightGray.cgColor
        followButton.backgroundColor = .black
        infoLabel.textColor = .gray

        artistLabel.font = UIFont.baskerville(ofSize: 14)
        artistLocationLabel.font = UIFont.baskerville(ofSize: 14).italic
        infoLabel.font = UIFont.arial(ofSize: 14, type: .light)
    }

    private func addConstraints() {
        borderView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, width: 250, height: 350)
        paintingImageView.anchor(top: borderView.topAnchor, left: borderView.leftAnchor, right: borderView.rightAnchor, height: 200, margin: 10)
        artistLabel.anchor(top: paintingImageView.bottomAnchor, left: borderView.leftAnchor, right: borderView.rightAnchor, paddingTop: 10, paddingLeft: 10)
        artistLocationLabel.anchor(top: artistLabel.bottomAnchor, left: borderView.leftAnchor, right: borderView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        infoLabel.anchor(top: artistLocationLabel.bottomAnchor, left: borderView.leftAnchor, right: borderView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        followButton.anchor(top: infoLabel.bottomAnchor, left: borderView.leftAnchor, right: borderView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, width: 30)
    }

    func configCell() {
        paintingImageView.setImage(imageUrl: "https://picsum.photos/id/870/200/300/?blur")
        artistLabel.text = "Frank Stella"
        artistLocationLabel.text = "Canadian, 1925 - 1992"
        infoLabel.text = "7 works, 5 for sale"
        followButton.setTitle("Follow", for: .normal)
    }
}
