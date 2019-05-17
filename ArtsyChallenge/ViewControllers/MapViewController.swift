//
//  LocationViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import FittedSheets
import MapKit
import UIKit

class MapViewController: UIViewController {
    var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addMap()
        addDragableView()
    }

    private func addMap() {
        view.backgroundColor = UIColor.white
        mapView = MKMapView(frame: view.frame)
        view.addSubview(mapView!)
    }

    private func addDragableView() {
        let sheetController = SheetViewController(controller: ArtistsController(childType: .artist, isFooterVisible: false), sizes: [.fixed(100), .fixed(300), .halfScreen, .fullScreen, .fixed(100)])
        sheetController.dismissOnBackgroundTap = false
        sheetController.extendBackgroundBehindHandle = true
        sheetController.topCornersRadius = 15
        sheetController.overlayColor = .clear
        sheetController.pullBarView.backgroundColor = .white

        present(sheetController, animated: false, completion: nil)
    }
}
