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
    private let text: String

    init(frame: CGRect, text: String) {
        self.text = text
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyle()
        setText()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(footerLabel)
    }

    private func addConstraints() {
        footerLabel.anchor( left: leftAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20 )
        footerLabel.alignVertical()
    }

    private func setStyle() {
        footerLabel.textColor = .white
        footerLabel.font = UIFont.baskerville(ofSize: 16)
        self.backgroundColor = .black
    }
    
    private func setText(){
        footerLabel.text = text
    }
}
