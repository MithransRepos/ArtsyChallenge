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
        return 5
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection _: Int) -> UIView? {
        let headerView: TableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeader.identifier) as! TableViewHeader
        headerView.configView(title: "Recommended Art Fairs")
        headerView.backgroundColor = .red
        return headerView
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let layoutType: FlowLayoutType = indexPath.section.isEven ? .horizontal : .vertical
        let cell: TableCollectionViewCell = TableCollectionViewCell(layoutType: layoutType)
        return cell
    }

    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = indexPath.section.isEven ? 350 : 200 * 3
        return CGFloat(height)
    }

    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_: UITableView, viewForFooterInSection _: Int) -> UIView? {
        return nil
    }
}
