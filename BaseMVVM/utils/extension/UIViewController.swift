//
//  UIViewController.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit

extension UIViewController {
    
    public func add(asChildViewController viewController: UIViewController,to parentView:UIView) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        parentView.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = parentView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    public func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
}
