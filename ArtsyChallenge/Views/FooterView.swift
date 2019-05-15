//
//  FooterView.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    private let footerLabel: UILabel = ViewHelper.getLabel()
    let text: String
    init(frame: CGRect, text: String) {
        self.text = text
        super.init(frame: frame)
        addViews()
        footerLabel.text = text
        footerLabel.textColor = .white
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(footerLabel)
        addConstraints()
    }

    private func addConstraints() {
        footerLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor,paddingTop: 15, paddingLeft: 24, paddingBottom: 10, paddingRight:  24)
    }
}
