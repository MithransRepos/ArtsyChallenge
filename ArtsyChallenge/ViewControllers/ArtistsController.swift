//
//  ArtChildViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class ArtistsController: BaseChildViewController {
    private let viewModel: ArtChildViewModel = ArtChildViewModel()
    
    private var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            registerViews()
        }
    }
    
    override func viewDidLoad() {
//        childType = .auction
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = ViewHelper.getWaterFallLayout()
        layout.delegate = self
        layout.headerHeight = 80.0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: isFooterVisible ? -bottomHeightWithMenu : 0)
    }
    
    private func registerViews() {
        collectionView.register(ArtistHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArtistHeaderView.identifier)
        collectionView.register(PaitingCell.self, forCellWithReuseIdentifier: PaitingCell.identifier)
        collectionView.register(AuctionCell.self, forCellWithReuseIdentifier: AuctionCell.identifier)
        collectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.identifier)
    }
}


extension ArtistsController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        return noOfSections
    }
    
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return noOfitemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getCell(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return getHeaderView(at: indexPath, kind: kind)
    }
}

extension ArtistsController: WaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout _: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getCellSize(at: indexPath.row)
    }
    
    func collectionViewLayout(for section: Int) -> WaterfallLayout.Layout {
        return getLayout()
    }
    
    func collectionView(_: UICollectionView, layout _: WaterfallLayout, headerHeightFor _: Int) -> CGFloat? {
        return getHeaderHeight()
    }
}

extension ArtistsController {
    var noOfSections: Int {
        guard childType == .artist else { return viewModel.auctionStageCount }
        return viewModel.artistCount
    }
    
    var noOfitemsInSection: Int {
        guard childType == .artist else { return viewModel.auctionCount }
        return viewModel.paintingCount
    }
    
    func getCellSize(at index: Int) -> CGSize{
        guard childType == .artist else { return CGSize(width: 200, height: 250) }
        return CGSize(width: 200, height: index.isEven ? 250 : 350)
    }
    
    func getLayout() -> WaterfallLayout.Layout {
        guard childType == .artist else { return .flow(column: 2) }
        return .waterfall(column: 2, distributionMethod: .balanced)
    }
    
    func getHeaderHeight() -> CGFloat {
//        guard childType == .artist else { return 50 }
        return 50
    }
    
    func getCell(at indexPath: IndexPath) -> UICollectionViewCell {
        guard childType == .artist else {
            let cell: AuctionCell = collectionView.dequeueReusableCell(withReuseIdentifier: AuctionCell.identifier, for: indexPath) as! AuctionCell
            cell.configCell(auction: viewModel.getAuction(at: indexPath.row))
            return cell
        }
        let cell: PaitingCell = collectionView.dequeueReusableCell(withReuseIdentifier: PaitingCell.identifier, for: indexPath) as! PaitingCell
        cell.configCell(row: indexPath.row, painting: viewModel.getPainting(at: indexPath.row))
        return cell
    }
    
    func getHeaderView(at indexPath: IndexPath, kind: String) -> UICollectionReusableView {
        guard childType == .artist else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeader.identifier, for: indexPath) as! CollectionViewHeader
            header.configView(title: viewModel.getAuctionStage(at: indexPath.section))
            return header
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ArtistHeaderView.identifier, for: indexPath) as! ArtistHeaderView
        header.configView(artist: viewModel.getArtist(at: indexPath.section))
        return header
    }
}
