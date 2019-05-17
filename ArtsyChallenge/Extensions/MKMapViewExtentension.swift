//
//  UIMapExtentension.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/17/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import MapKit
extension MKMapView {
    func annotationView<T: MKAnnotationView>(of type: T.Type, annotation: MKAnnotation?, reuseIdentifier: String) -> T {
        guard let annotationView = dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? T else {
            return type.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        }
        annotationView.annotation = annotation
        return annotationView
    }

    func annotationView(annotation: MKAnnotation?, reuseIdentifier: String) -> MKAnnotationView {
        let annotationView = self.annotationView(of: CountClusterAnnotationView.self, annotation: annotation, reuseIdentifier: reuseIdentifier)
        annotationView.countLabel.backgroundColor = .lightBlack
        return annotationView
    }
}
