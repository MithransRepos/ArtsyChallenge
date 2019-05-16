//
//  ReusableView.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/16/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
import UIKit

protocol RDReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension RDReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol RDNibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension RDNibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

// Confirming Collection View and TableView for Registering and Dequeing

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: RDReusableView {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UICollectionViewCell>(_: T.Type) where T: RDReusableView, T: RDNibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: RDReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }

    // Registering Supplementary View

    func register<T: UICollectionReusableView>(_: T.Type, supplementaryViewOfKind: String) where T: RDReusableView {
        register(T.self, forSupplementaryViewOfKind: supplementaryViewOfKind, withReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UICollectionReusableView>(_: T.Type, supplementaryViewOfKind: String) where T: RDReusableView, T: RDNibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: supplementaryViewOfKind, withReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind: String, indexPath: IndexPath) -> T where T: RDReusableView {
        guard let supplementaryView = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue supplementary view with identifier: \(T.defaultReuseIdentifier)")
        }
        return supplementaryView
    }
}

extension UITableView {
    // Registering Cell
    func register<T: UITableViewCell>(_: T.Type) where T: RDReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewCell>(_: T.Type) where T: RDReusableView, T: RDNibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: RDReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }

    // Registering HeaderFooterView

    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: RDReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: RDReusableView, T: RDNibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) -> T where T: RDReusableView {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not dequeue Header/Footer with identifier: \(T.defaultReuseIdentifier)")
        }
        return headerFooter
    }
}
