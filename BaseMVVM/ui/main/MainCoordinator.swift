//
//  MainCoordinator.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {
        showMainViewController()
    }

    func showMainViewController() {
        if let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            let viewModel = MainViewModel()
            mainViewController.viewModel = viewModel
            navigationController.show(mainViewController, sender: self)
        }
    }

}
