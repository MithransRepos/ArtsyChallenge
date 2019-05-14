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
        let homeBar = UITabBarItem(title: nil, image: Icon.home.getImage.renderOriginal(), selectedImage:Icon.homeSelected.getImage.renderOriginal())
        let mapBar = UITabBarItem(title: nil, image: Icon.map.getImage.renderOriginal(), selectedImage:Icon.mapSelected.getImage.renderOriginal())
        homeViewController.tabBarItem = homeBar.showOnlyImage()
        locationViewController.tabBarItem = mapBar.showOnlyImage()
        let tabBarList = [homeViewController, locationViewController]
        tabBar.backgroundColor = .white
        viewControllers = tabBarList
    }
   

}
