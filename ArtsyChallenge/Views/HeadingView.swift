//
//  HeadingView.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class HeadingView: UIView {
    private let titleLabel: UILabel = ViewHelper.getLabel()
    
    private let subTitleLabel: UILabel = ViewHelper.getLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        setStyles()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
    }
    
    private func addConstraints() {
        titleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
        subTitleLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20)
    }
    
    private func setStyles() {
        titleLabel.font = UIFont.baskerville(ofSize: 30)
        subTitleLabel.font = UIFont.baskerville(ofSize: 20)
    }
    
    func configView(title: String, subtitle: String? = nil) {
        titleLabel.text = title
        subTitleLabel.text = subtitle
    }
    
}
