//
//  LocationViewController.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/13/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Cluster
import FittedSheets
import MapKit
import UIKit

class MapViewController: UIViewController {
    let region = (center: CLLocationCoordinate2D(latitude: 28.4595, longitude: 77.0266), delta: 0.1)

    var mapView: MKMapView! {
        didSet {
            mapView.delegate = self
            mapView.region = .init(center: region.center, span: .init(latitudeDelta: region.delta, longitudeDelta: region.delta))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addMap()
        addDragableView()
        manager.add(MeAnnotation(coordinate: region.center))
        addAnnotations()
    }

    lazy var manager: ClusterManager = { [unowned self] in
        let manager = ClusterManager()
        manager.delegate = self
        manager.maxZoomLevel = 17
        manager.minCountForClustering = 3
        manager.clusterPosition = .nearCenter
        return manager
    }()

    private func addMap() {
        view.backgroundColor = UIColor.white
        mapView = MKMapView(frame: view.frame)
        view.addSubview(mapView!)
    }

    private func addDragableView() {
        let sheetController = SheetViewController(controller: DummyViewController(), sizes: [.fixed(100), .fixed(300), .halfScreen, .fullScreen, .fixed(100)])
        sheetController.dismissOnBackgroundTap = false
        sheetController.extendBackgroundBehindHandle = true
        sheetController.topCornersRadius = 15
        sheetController.overlayColor = .clear
        sheetController.pullBarView.backgroundColor = .white

        present(sheetController, animated: false, completion: nil)
    }

    private func addAnnotations() {
        // Add annotations to the manager.
        let annotations: [Annotation] = (0 ..< 40).map { _ in
            let annotation = Annotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude + drand48() * region.delta - region.delta / 2, longitude: region.center.longitude + drand48() * region.delta - region.delta / 2)
            return annotation
        }
        manager.add(annotations)
        manager.reload(mapView: mapView)
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? ClusterAnnotation {
            let identifier = "Cluster"
            return mapView.annotationView(annotation: annotation, reuseIdentifier: identifier)
        } else if let annotation = annotation as? MeAnnotation {
            let identifier = "Me"
            let annotationView = mapView.annotationView(of: MKAnnotationView.self, annotation: annotation, reuseIdentifier: identifier)
            annotationView.image = .me
            return annotationView
        } else {
            let identifier = "Pin"
            let annotationView = mapView.annotationView(of: MKPinAnnotationView.self, annotation: annotation, reuseIdentifier: identifier)
            annotationView.pinTintColor = .lightBlack
            return annotationView
        }
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated _: Bool) {
        manager.reload(mapView: mapView) { finished in
            print(finished)
        }
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation else { return }

        if let cluster = annotation as? ClusterAnnotation {
            var zoomRect = MKMapRect.null
            for annotation in cluster.annotations {
                let annotationPoint = MKMapPoint(annotation.coordinate)
                let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0, height: 0)
                if zoomRect.isNull {
                    zoomRect = pointRect
                } else {
                    zoomRect = zoomRect.union(pointRect)
                }
            }
            mapView.setVisibleMapRect(zoomRect, animated: true)
        }
    }

    func mapView(_: MKMapView, didAdd views: [MKAnnotationView]) {
        views.forEach { $0.alpha = 0 }
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            views.forEach { $0.alpha = 1 }
        }, completion: nil)
    }
}

extension MapViewController: ClusterManagerDelegate {
    func cellSize(for _: Double) -> Double? {
        return nil // default
    }

    func shouldClusterAnnotation(_ annotation: MKAnnotation) -> Bool {
        return !(annotation is MeAnnotation)
    }
}

class MeAnnotation: Annotation {}
