//
//  ArtChildViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class ArtistsController: BaseChildViewController {
    private var collectionView: UICollectionView! {
        didSet {
            collectionView.register(ArtistHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArtistHeaderView.identifier)
            collectionView.register(PaitingCell.self, forCellWithReuseIdentifier: PaitingCell.identifier)
            collectionView.register(AuctionCell.self, forCellWithReuseIdentifier: AuctionCell.identifier)
            collectionView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = ViewHelper.getWaterFallLayout()
        layout.headerHeight = 80.0
        layout.delegate = self
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: isFooterVisible ? -bottomHeightWithMenu : 0)
    }
}

// TODO: change to enum based sections
extension ArtistsController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0, childType == .auction {
            let cell: AuctionCell = collectionView.dequeueReusableCell(withReuseIdentifier: AuctionCell.identifier, for: indexPath) as! AuctionCell
            cell.configCell()
            return cell
        } else {
            let cell: PaitingCell = collectionView.dequeueReusableCell(withReuseIdentifier: PaitingCell.identifier, for: indexPath) as! PaitingCell
            cell.configCell(row: indexPath.row)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ArtistHeaderView.identifier, for: indexPath) as! ArtistHeaderView
            header.configView()
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension ArtistsController: WaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout _: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0, childType == .auction {
            return CGSize(width: 200, height: 250)
        }
        return CGSize(width: 200, height: indexPath.row.isEven ? 250 : 350)
    }

    func collectionViewLayout(for section: Int) -> WaterfallLayout.Layout {
        if section == 0, childType == .auction {
            return .flow(column: 2)
        }
        return .waterfall(column: 2, distributionMethod: .balanced)
    }

    func collectionView(_: UICollectionView, layout _: WaterfallLayout, headerHeightFor _: Int) -> CGFloat? {
        return 65
    }
}
