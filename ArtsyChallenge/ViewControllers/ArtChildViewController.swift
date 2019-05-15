//
//  ArtChildViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ArtChildViewController: UIViewController {
    enum ChildType: String, CaseIterable {
        case artist = "Artists"
        case forYou = "For you"
        case auction = "Auctions"
    }

    var childType: ChildType = .artist

    let collectionCellIdentifier: String = "collectionCell"
    let collectionHeaderIdentifier: String = "collectionHeader"

    init(childType: ChildType) {
        self.childType = childType
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionHeaderIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 149, right: 0)
        view.addSubview(collectionView)
    }
}

extension ArtChildViewController: IndicatorInfoProvider {
    func indicatorInfo(for _: PagerTabStripViewController) -> IndicatorInfo {
        let indicatorItem = IndicatorInfo(title: childType.rawValue)
        return indicatorItem
    }
}

extension ArtChildViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 5
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        cell.paintingImageView.backgroundColor = UIColor.black
        cell.priceLabel.backgroundColor = UIColor.red
        cell.authorLabel.backgroundColor = UIColor.blue
        cell.infoLabel.backgroundColor = UIColor.lightGray
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.width() - (48 + 20)) / 2, height: 200)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        return CGSize(width: view.width(), height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionHeaderIdentifier, for: indexPath) as! SectionHeaderView
        headerView.avatarImageView.backgroundColor = UIColor.black
        headerView.authorLabel.backgroundColor = UIColor.blue
        headerView.infoLabel.backgroundColor = UIColor.lightGray
        return headerView
    }
}
