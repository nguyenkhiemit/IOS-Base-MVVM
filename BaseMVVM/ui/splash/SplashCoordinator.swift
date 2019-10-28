//
//  SplashCoordinator.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

final class SplashCoordinator: Coordinator {

    fileprivate var isLoggedIn = false

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {
        showSplashViewController()
    }

    func showSplashViewController() {
        if let splashViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController {
            splashViewController.delegate = self
            let viewModel = SplashViewModel()
            splashViewController.viewModel = viewModel
            navigationController.show(splashViewController, sender: self)
        }
    }

    fileprivate func showAuthentication() {
        let authenicationCoordinator = AuthenticationCoordinator(navigationController: navigationController)
        authenicationCoordinator.delegate = self
        authenicationCoordinator.start()
    }

    fileprivate func showMain() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()
    }

}

extension SplashCoordinator: SplashViewControllerDelegate {
    func showLoginScreen() {
        showAuthentication()
    }

    func showMainScreen() {
        showMain()
    }
}

extension SplashCoordinator: AuthenticationCoordinatorDelegate {

    func coordinatorDidAuthenticate(coordinator: AuthenticationCoordinator) {
        showMain()
    }
}
