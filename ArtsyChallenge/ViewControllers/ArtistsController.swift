//
//  ArtChildViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class ArtistsController: BaseChildViewController {
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView = ViewHelper.getCollectionView(layoutType: .vertical)
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: isFooterVisible ? -bottomHeightWithMenu : 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCollectionViewCells()
    }

    private func registerCollectionViewCells() {
        collectionView.register(PaitingCell.self, forCellWithReuseIdentifier: PaitingCell.identifier)
        collectionView.register(ArtistHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArtistHeaderView.identifier)
    }
}

extension ArtistsController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 5
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaitingCell.identifier, for: indexPath as IndexPath) as! PaitingCell
        cell.configCell()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.width - (48 + 20)) / 2, height: 200)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        return CGSize(width: view.width, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ArtistHeaderView.identifier, for: indexPath) as! ArtistHeaderView
        headerView.configView()
        return headerView
    }
}
