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
        setupXStripBarStyle()
        super.viewDidLoad()
        setupXStripBar()
        setupFooterView()
    }

    private func setupXStripBarStyle() {
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarItemTitleColor = .black
    }

    private func setupXStripBar() {
        buttonBarView.removeFromSuperview()
        navigationController?.navigationBar.addSubview(buttonBarView)
    }

    private func setupFooterView() {
        let footer = UIView(frame: CGRect(x: 0, y: (view.height() - getBottomPadding()) - 99, width: view.frame.width, height: 50))
        footer.backgroundColor = .black
        view.addSubview(footer)
    }

    override func viewControllers(for _: PagerTabStripViewController) -> [UIViewController] {
        var pages: [UIViewController] = []
        for type in ArtChildViewController.ChildType.allCases.map({ $0 }) {
            pages.append(ArtChildViewController(childType: type))
        }
        return pages
    }

    override func reloadPagerTabStripView() {
        super.reloadPagerTabStripView()
    }

    override func configureCell(_ cell: ButtonBarViewCell, indicatorInfo: IndicatorInfo) {
        super.configureCell(cell, indicatorInfo: indicatorInfo)
        cell.backgroundColor = .clear
    }
}
