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
    
    private var footerText: String? {
        didSet {
            if let text = footerText {
               setupFooterView(text: text)
            }
        }
    }
    
    
    override func viewDidLoad() {
        setStripBarStyle()
        super.viewDidLoad()
        setupXStripBar()
        footerText = "Sell works from your collection through Artsy"
    }

    private func setStripBarStyle() {
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarItemFont = UIFont.arial(ofSize: 14, type: .regular)
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

    private func setupFooterView(text: String) {
        let frame: CGRect = CGRect(x: 0, y: view.height - bottomHeightWithMenu, width: view.frame.width, height: 50)
        let footer = FooterView(frame: frame, text: text)
        view.addSubview(footer)
    }

    override func viewControllers(for _: PagerTabStripViewController) -> [UIViewController] {
        return [ArtistsController(childType: .artist, isFooterVisible: isFooterVisible), ForyouViewController(childType: .forYou, isFooterVisible: isFooterVisible), ArtistsController(childType: .auction, isFooterVisible: isFooterVisible)]
    }

    override func configureCell(_ cell: ButtonBarViewCell, indicatorInfo: IndicatorInfo) {
        super.configureCell(cell, indicatorInfo: indicatorInfo)
        cell.backgroundColor = .clear
    }
}
extension HomeViewController {
    var isFooterVisible: Bool {
        return footerText != nil
    }
    
}
