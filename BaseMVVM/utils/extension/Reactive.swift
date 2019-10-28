//
//  Reactive.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import UIKit
import RxSwift
import RxCocoa

extension UIViewController: loadingViewable {}

extension Reactive where Base: UIViewController {

    /// Bindable sink for `startAnimating()`, `stopAnimating()` methods.
    public var isAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                vc.startAnimating()
            } else {
                vc.stopAnimating()
            }
        })
    }

}
