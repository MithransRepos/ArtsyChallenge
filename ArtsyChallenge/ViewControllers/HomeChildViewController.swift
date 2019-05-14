//
//  HomeChildViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeChildViewController: UIViewController {
    var tittleText: String = ""

    init(tittleText: String) {
        self.tittleText = tittleText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }
}

extension HomeChildViewController: IndicatorInfoProvider {
    func indicatorInfo(for _: PagerTabStripViewController) -> IndicatorInfo {
        let indicatorItem = IndicatorInfo(title: tittleText)
        return indicatorItem
    }
}

extension HomeChildViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.width() - (48 + 20) ) / 2, height: 250);
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
}
