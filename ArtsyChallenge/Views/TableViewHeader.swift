//
//  GenericCollectionViewHeader.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class TableViewHeader: UITableViewHeaderFooterView {
    static let identifier = "TableViewHeader"

    private var headerView: HeadingView!

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        headerView = HeadingView(frame: frame)
        addSubview(headerView)
    }

    private func addConstraints() {
        headerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
    }

    func configView(title: String, subtitle: String? = nil) {
        headerView.configView(title: title, subtitle: subtitle)
    }
}
