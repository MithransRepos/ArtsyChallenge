//
//  RootViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
    }

    private func setupMenu() {
        tabBar.backgroundColor = .white
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let locationViewController = MapViewController()
        homeViewController.tabBarItem = UITabBarItem.with(icon: Icon.home)
        locationViewController.tabBarItem = UITabBarItem.with(icon: Icon.map)
        viewControllers = [homeViewController, locationViewController]
    }
}
