//
//  ForyouViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class ForyouViewController: BaseChildViewController {
    
    private var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            registerTableViewCells()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView = ViewHelper.getTableView()
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: isFooterVisible ? -bottomHeightWithMenu : 0)
    }

    private func registerTableViewCells() {
        tableView.register(TableCollectionViewCell.self, forCellReuseIdentifier: TableCollectionViewCell.identifier)
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: TableViewHeader.identifier)
    }
}

extension ForyouViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tableSection: Sections = Sections(rawValue: section)!
        let headerView: TableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeader.identifier) as! TableViewHeader
        headerView.configView(title: tableSection.getHeading())
        return headerView
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection: Sections = Sections(rawValue: indexPath.section)!
        let cell: TableCollectionViewCell = TableCollectionViewCell(layoutType: tableSection.getCollectionViewType())
        return cell
    }

    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableSection: Sections = Sections(rawValue: indexPath.section)!
        return tableSection.sectionHeight()
    }

    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_: UITableView, viewForFooterInSection _: Int) -> UIView? {
        return nil
    }
}

extension ForyouViewController {
    enum Sections: Int, CaseIterable {
        case recommendedFairs
        case recentlyViewed
        case recommendedWorks
        case artistsToFollow
        case artistsYouFollow
        
        func getCollectionViewType() -> TableCollectionViewCell.CollectionViewType {
            switch self {
            case .recommendedFairs:
                return .recommenedArts
            case .recentlyViewed, .recommendedWorks, .artistsYouFollow:
                return .paintings
            case .artistsToFollow:
                return .artistToFollow
            }
            
        }
        
        func sectionHeight() -> CGFloat {
            switch self {
            case .recommendedFairs:
                return 120
            case .recentlyViewed, .recommendedWorks, .artistsYouFollow:
                return 200 * 3
            case .artistsToFollow:
                return 300
            }
        }
        
        func getHeading() -> String {
            switch self {
            case .recommendedFairs:
                return "Recommended Art Fairs"
            case .recentlyViewed:
                return "Recently viewed"
            case .recommendedWorks:
                return "Recommended works"
            case .artistsToFollow:
                return "Artists to Follow"
            case .artistsYouFollow:
                return "Artists you Follow"
            }
        }
        
    }
}
