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
    
    private var artist: Artist? {
        didSet {
            setData()
        }
    }

    private let avatarImageView: UIImageView = ViewHelper.getImageView()

    private let artistLabel: UILabel = ViewHelper.getLabel()

    private let infoLabel: UILabel = ViewHelper.getLabel()

    private func addViews() {
        addSubview(avatarImageView)
        addSubview(artistLabel)
        addSubview(infoLabel)
    }

    private func addConstraints() {
        avatarImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20, width: 45, height: 45)
        artistLabel.anchor(top: topAnchor, left: avatarImageView.rightAnchor, right: rightAnchor, paddingTop: 25, paddingLeft: 10, paddingRight: 24)
        infoLabel.anchor(top: artistLabel.bottomAnchor, left: avatarImageView.rightAnchor, right: rightAnchor, paddingLeft: 10, paddingRight: 24)
    }

    private func setStyle() {
        artistLabel.font = UIFont.arial(ofSize: 14, type: .bold)
        infoLabel.font = UIFont.baskerville(ofSize: 14)
        infoLabel.textColor = .gray
    }

    private func setData() {
        avatarImageView.setAvatarImage(imageUrl: artist?.artistPic)
        artistLabel.text = artist?.name.uppercased()
        infoLabel.text = artist?.info
    }
    
    func configView(artist: Artist) {
        self.artist = artist
    }
}
