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
        self.setupMenu()
    }
    
    private func setupMenu() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController()) 
        let locationViewController = LocationViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        locationViewController.tabBarItem = UITabBarItem(title: "Map", image: nil, tag: 0)
        let tabBarList = [homeViewController, locationViewController]
        viewControllers = tabBarList
    }
   

}
