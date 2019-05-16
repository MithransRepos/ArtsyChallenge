//
//  GenericCollectionViewHeader.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class GenericTableViewHeader: UITableViewHeaderFooterView {
    static let identifier = "GenericTableViewHeader"

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let titleLabel: UILabel = ViewHelper.getLabel()

    private let subTitleLabel: UILabel = ViewHelper.getLabel()

    private func addViews() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addConstraints()
    }

    private func addConstraints() {
        titleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 24, paddingRight: 24, height: 30)
        subTitleLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 24, paddingRight: 24, height: 20)
    }

    func configView(title: String, subtitle: String?) {
        titleLabel.text = title
        subTitleLabel.text = subtitle
    }
}
