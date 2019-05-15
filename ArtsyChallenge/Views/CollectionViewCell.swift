//
//  CollectionViewCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let paintingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

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
    
    
    private func addConstraints(){
        paintingImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 100)
        priceLabel.anchor(top: paintingImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, height: 22)
        authorLabel.anchor(top: priceLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, height: 22)
        infoLabel.anchor(top: authorLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,paddingTop: 5, paddingBottom: 5)
    }


    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell() {}
}
