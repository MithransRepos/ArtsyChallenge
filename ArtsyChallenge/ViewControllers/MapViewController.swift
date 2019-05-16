//
//  LocationViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMap()
    }
    
    private func addMap() {
        self.view.backgroundColor = UIColor.white
        self.mapView = MKMapView(frame: self.view.frame)
        self.view.addSubview(self.mapView!)
    }
}
