//
//  ArtistHeaderView.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class ArtistHeaderView: UICollectionReusableView {
    static let identifier = "ArtistHeaderView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyle()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let avatarImageView: UIImageView = ViewHelper.getImageView()

    private let authorLabel: UILabel = ViewHelper.getLabel()

    private let infoLabel: UILabel = ViewHelper.getLabel()

    private func addViews() {
        addSubview(avatarImageView)
        addSubview(authorLabel)
        addSubview(infoLabel)
    }

    private func addConstraints() {
        avatarImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20, width: 45, height: 45)
        authorLabel.anchor(top: topAnchor, left: avatarImageView.rightAnchor, right: rightAnchor, paddingTop: 25, paddingLeft: 10, paddingRight: 24)
        infoLabel.anchor(top: authorLabel.bottomAnchor, left: avatarImageView.rightAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingRight: 24, height: 22)
    }

    private func setStyle(){
        authorLabel.font = UIFont.arial(ofSize: 14, type: .bold)
        infoLabel.font = UIFont.baskerville(ofSize: 14)
        infoLabel.textColor = .gray
    }
    
    func configView() {
        avatarImageView.setAvatarImage(imageUrl: "https://picsum.photos/60/60")
        authorLabel.text = "PABLO PICASSO".uppercased()
        infoLabel.text = "4 works added"
    }
}
