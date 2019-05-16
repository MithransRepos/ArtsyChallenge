//
//  HomeViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {
    override func viewDidLoad() {
        setStripBarStyle()
        super.viewDidLoad()
        setupXStripBar()
        setupFooterView()
    }

    private func setStripBarStyle() {
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarItemTitleColor = .lightGray
    }

    private func setupXStripBar() {
        buttonBarView.removeFromSuperview()
        navigationController?.navigationBar.addSubview(buttonBarView)
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, _: CGFloat, changeCurrentIndex: Bool, _: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .lightGray
            newCell?.label.textColor = .black
        }
    }

    private func setupFooterView() {
        let frame: CGRect = CGRect(x: 0, y: (view.height() - getBottomPadding()) - 99, width: view.frame.width, height: 50)
        let footer = FooterView(frame: frame, text: "Footer Text")
        footer.backgroundColor = .black
        view.addSubview(footer)
    }

    override func viewControllers(for _: PagerTabStripViewController) -> [UIViewController] {
        return [ArtistsController(childType: .artist, isFooterVisible: true), ForYouViewController(childType: .forYou, isFooterVisible: true), ArtistsController(childType: .auction, isFooterVisible: true)]
    }

    override func configureCell(_ cell: ButtonBarViewCell, indicatorInfo: IndicatorInfo) {
        super.configureCell(cell, indicatorInfo: indicatorInfo)
        cell.backgroundColor = .clear
    }
}
