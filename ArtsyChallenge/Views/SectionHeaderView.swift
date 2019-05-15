//
//  SectionHeaderView.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/14/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let avatarImageView: UIImageView = {
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
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        addSubview(avatarImageView)
        addSubview(authorLabel)
        addSubview(infoLabel)
        addConstraints()
    }
    
    private func addConstraints(){
        avatarImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 24, width: 60, height: 60)
        authorLabel.anchor(top: topAnchor, left: avatarImageView.rightAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 24, height: 22)
        infoLabel.anchor(top: authorLabel.bottomAnchor, left: avatarImageView.rightAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 24, height: 22)
    }
}
