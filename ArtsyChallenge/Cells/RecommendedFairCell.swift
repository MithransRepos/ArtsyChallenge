//
//  RecommendedFairCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class RecommendedFairCell: BaseCollectionViewCell {
    private let view: UIView = ViewHelper.getView()

    private let label: UILabel = ViewHelper.getLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyle()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell() {
        label.text = "PHOTO \n LONDON"
    }
}

extension RecommendedFairCell: BaseViewProtocol {
    internal func addViews() {
        addSubview(view)
        addSubview(label)
    }

    internal func addConstraints() {
        view.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingBottom: 10, width: 80, height: 80)
    }

    internal func setStyle() {
        label.numberOfLines = 2
        label.font = UIFont.baskerville(ofSize: 16)
        view.backgroundColor = .random
        view.setRounded()
        label.alignCenter()
    }
}
