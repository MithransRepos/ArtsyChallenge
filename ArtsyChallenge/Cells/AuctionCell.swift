//
//  AuctionCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class AuctionCell: BaseCollectionViewCell {
    private let paintingImageView: UIImageView = ViewHelper.getImageView()

    private let artistLabel: UILabel = ViewHelper.getLabel()

    private let liveLabel: UILabel = ViewHelper.getLabel()

    private let infoLabel: UILabel = ViewHelper.getLabel()

    private var auction: Auction? {
        didSet {
            setData()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyle()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setData() {
        paintingImageView.setImage(imageUrl: auction?.imageUrl)
        artistLabel.text = auction?.artistName
        infoLabel.text = auction?.currentStatus
        liveLabel.text = auction?.isLive ?? false ? "LIVE" : ""
        liveLabel.isHidden = !(auction?.isLive ?? false)
    }

    func configCell(auction: Auction) {
        self.auction = auction
    }
}

extension AuctionCell: BaseViewProtocol {
    internal func addViews() {
        addSubview(paintingImageView)
        addSubview(artistLabel)
        addSubview(liveLabel)
        addSubview(infoLabel)
    }

    internal func setStyle() {
        artistLabel.textColor = .white
        liveLabel.backgroundColor = .white
        infoLabel.textColor = .white
        liveLabel.textColor = .black
        liveLabel.textAlignment = .center
        liveLabel.font = UIFont.arial(ofSize: 9).bold
        artistLabel.font = UIFont.baskerville(ofSize: 16)
        infoLabel.font = UIFont.arial(ofSize: 12)
        artistLabel.backgroundColor = .transparentBlack
        artistLabel.numberOfLines = 2
    }

    internal func addConstraints() {
        paintingImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 250)
        liveLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 10, paddingRight: 5, width: 30, height: 15)
        artistLabel.anchor(top: topAnchor, left: leftAnchor, right: liveLabel.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 5)
        infoLabel.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 10, paddingBottom: -5)
    }
}
