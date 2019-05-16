//
//  ForYouViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class ForYouViewController: BaseChildViewController {
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.separatorColor = .clear
        tableView.register(TableCollectionViewCell.self, forCellReuseIdentifier: TableCollectionViewCell.identifier)
        tableView.register(GenericTableViewHeader.self, forHeaderFooterViewReuseIdentifier: GenericTableViewHeader.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        view.addSubview(tableView)
    }
}

extension ForYouViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: GenericTableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: GenericTableViewHeader.identifier) as! GenericTableViewHeader
        headerView.configView(title: "Recommended Art Fairs", subtitle: nil)
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
        let height = indexPath.section.isEven ? 148 : 200 * 3
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
