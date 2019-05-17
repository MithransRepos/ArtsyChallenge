//
//  TableCollectionViewCell.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class TableCollectionViewCell: UITableViewCell {
    enum CollectionViewType {
        case recommenedArts
        case artistToFollow
        case paintings

        func getItemSize(at index: Int) -> CGSize {
            switch self {
            case .recommenedArts:
                return CGSize(width: 100, height: 100)
            case .artistToFollow:
                return CGSize(width: 250, height: 350)
            case .paintings:
                return CGSize(width: 200, height: index.isEven ? 250 : 350)
            }
        }
    }

    static let identifier = "TableCollectionViewCell"

    private var layoutType: CollectionViewType = .recommenedArts

    private var waterFallLayout: WaterfallLayout? {
        didSet {
            waterFallLayout?.delegate = self
        }
    }

    private var collectionView: UICollectionView! {
        didSet {
            if layoutType != .paintings { collectionView.delegate = self }
            collectionView.dataSource = self
            registerViews()
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(layoutType: CollectionViewType) {
        self.layoutType = layoutType
        super.init(style: .default, reuseIdentifier: TableCollectionViewCell.identifier)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupView() {
        if layoutType == .paintings {
            let layout = ViewHelper.getWaterFallLayout()
            waterFallLayout = layout
            collectionView = ViewHelper.getCollectionView(layout: layout)
        } else {
            collectionView = ViewHelper.getHorizontalSliderCollectionView()
        }
        collectionView.isScrollEnabled = layoutType != .paintings
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }

    private func registerViews() {
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
        switch layoutType {
        case .recommenedArts:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedFairCell.identifier, for: indexPath as IndexPath) as! RecommendedFairCell
            cell.configCell()
            return cell
        case .artistToFollow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowArtistCell.identifier, for: indexPath as IndexPath) as! FollowArtistCell
            cell.configCell()
            return cell
        case .paintings:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaitingCell.identifier, for: indexPath as IndexPath) as! PaitingCell
            cell.configCell(row: indexPath.row, painting: Painting(price: "$6,500", artist: "Pablo Picasso", location: "Le crapaud, 1949", agency: "ArtRite", imageUrl: "https://picsum.photos/id/870/200/300"))
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return layoutType.getItemSize(at: indexPath.row)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
    }
}

extension TableCollectionViewCell: WaterfallLayoutDelegate {
    func collectionViewLayout(for _: Int) -> WaterfallLayout.Layout {
        return .waterfall(column: 2, distributionMethod: .balanced)
    }

    func collectionView(_: UICollectionView, layout _: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return layoutType.getItemSize(at: indexPath.row)
    }
}
