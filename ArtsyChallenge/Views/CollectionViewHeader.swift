//
//  CollectionViewHeader.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/17/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class CollectionViewHeader: UICollectionReusableView {
    
    static let identifier = "CollectionViewHeader"
    
    private var headerView: HeadingView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        headerView = HeadingView(frame: self.frame)
        addSubview(headerView)
    }
    
    private func addConstraints() {
        headerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
    }
    
    
    func configView(title: String, subtitle: String? = nil) {
        headerView.configView(title: title, subtitle: subtitle)
    }
}
