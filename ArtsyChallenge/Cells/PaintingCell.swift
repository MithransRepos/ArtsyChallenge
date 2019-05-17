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

    private let artistLabel: UILabel = ViewHelper.getLabel()

    private let locationLabel: UILabel = ViewHelper.getLabel()

    private let agencyLabel: UILabel = ViewHelper.getLabel()

    private var painting: Painting? {
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
        paintingImageView.setImage(imageUrl: painting?.imageUrl)
        priceLabel.text = painting?.price
        artistLabel.text = painting?.artist
        locationLabel.text = painting?.location
        agencyLabel.text = painting?.agency
    }

    func configCell(row: Int = 0, painting: Painting?) {
        paintingImageView.anchor(height: row.isEven ? 150 : 250)
        self.painting = painting
    }
}

extension PaitingCell: BaseViewProtocol {
    internal func addViews() {
        addSubview(paintingImageView)
        addSubview(priceLabel)
        addSubview(artistLabel)
        addSubview(locationLabel)
        addSubview(agencyLabel)
    }

    internal func addConstraints() {
        paintingImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        priceLabel.anchor(top: paintingImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, height: 20)
        artistLabel.anchor(top: priceLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 20)
        locationLabel.anchor(top: artistLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 20)
        agencyLabel.anchor(top: locationLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingBottom: 5, height: 20)
    }

    internal func setStyle() {
        priceLabel.font = UIFont.arial(ofSize: 20)
        artistLabel.font = UIFont.baskerville(ofSize: 14)
        locationLabel.font = UIFont.baskerville(ofSize: 14).italic
        agencyLabel.font = UIFont.arial(ofSize: 12)

        priceLabel.textColor = .black
        artistLabel.textColor = .black
        locationLabel.textColor = .lightBlack
        agencyLabel.textColor = .gray
    }
}
