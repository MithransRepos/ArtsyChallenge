//
//  ViewHelper.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit

class ViewHelper {
    static func getLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    static func getImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    static func getCollectionView(layoutType: FlowLayoutType) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutType.getLayout())
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }

    static func getTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorColor = .clear
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }

    static func getView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
