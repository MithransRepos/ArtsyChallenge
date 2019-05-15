//
//  FooterView.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    let footerLabel: UILabel = ViewHelper.getLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(footerLabel)
        addConstraints()
    }

    private func addConstraints() {
        footerLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, margin: 5)
    }
}
