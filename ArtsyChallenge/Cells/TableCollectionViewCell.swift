//
//  TableCollectionViewCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class TableCollectionViewCell: UITableViewCell {
    static let identifier = "TableCollectionViewCell"

    private var layoutType: FlowLayoutType = .vertical

    private var waterFallLayout: WaterfallLayout? {
        didSet {
            waterFallLayout?.delegate = self
        }
    }

    private var collectionView: UICollectionView! {
        didSet {
            if layoutType == .horizontal { collectionView.delegate = self }
            collectionView.dataSource = self
            registerCollectionViewCells()
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(layoutType: FlowLayoutType) {
        self.layoutType = layoutType
        super.init(style: .default, reuseIdentifier: TableCollectionViewCell.identifier)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupView() {
        if layoutType == .vertical {
            let layout = ViewHelper.getWaterFallLayout()
            waterFallLayout = layout
            collectionView = ViewHelper.getCollectionView(layout: layout)
        } else {
            collectionView = ViewHelper.getCollectionView(layoutType: layoutType)
        }
        collectionView.isScrollEnabled = layoutType == .horizontal
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }

    private func registerCollectionViewCells() {
        collectionView.register(PaitingCell.self, forCellWithReuseIdentifier: PaitingCell.identifier)
        collectionView.register(RecommendedFairCell.self, forCellWithReuseIdentifier: RecommendedFairCell.identifier)
        collectionView.register(FollowArtistCell.self, forCellWithReuseIdentifier: FollowArtistCell.identifier)
    }
}

extension TableCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if layoutType == .horizontal {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedFairCell.identifier, for: indexPath as IndexPath) as! RecommendedFairCell
            cell.configCell()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaitingCell.identifier, for: indexPath as IndexPath) as! PaitingCell
            cell.configCell()
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if layoutType == .horizontal {
            return CGSize(width: 100, height: 100)
        }
        return CGSize(width: (collectionView.width - (48 + 20)) / 2, height: 200)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
}

extension TableCollectionViewCell: WaterfallLayoutDelegate {
    func collectionViewLayout(for _: Int) -> WaterfallLayout.Layout {
        return .waterfall(column: 2, distributionMethod: .balanced)
    }

    func collectionView(_: UICollectionView, layout _: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: indexPath.row.isEven ? 250 : 350)
    }
}
