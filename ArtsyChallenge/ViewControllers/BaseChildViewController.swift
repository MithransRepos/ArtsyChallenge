//
//  BaseChildViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class BaseChildViewController: UIViewController {
    enum ChildType: String, CaseIterable {
        case artist = "Artists"
        case forYou = "For you"
        case auction = "Auctions"
    }

    var childType: ChildType = .artist

    init(childType: ChildType) {
        self.childType = childType
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseChildViewController: IndicatorInfoProvider {
    func indicatorInfo(for _: PagerTabStripViewController) -> IndicatorInfo {
        let indicatorItem = IndicatorInfo(title: childType.rawValue)
        return indicatorItem
    }
}
