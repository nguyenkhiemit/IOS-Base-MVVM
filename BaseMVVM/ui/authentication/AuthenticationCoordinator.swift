//
//  AuthenticationCoordinator.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol AuthenticationCoordinatorDelegate: class {
    func coordinatorDidAuthenticate(coordinator: AuthenticationCoordinator)
}

final class AuthenticationCoordinator: Coordinator {

    weak var delegate: AuthenticationCoordinatorDelegate?
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("deallocing \(self)")
    }

    func start() {
        showLoginViewController()
    }

    func showLoginViewController() {
        if let loginViewController = UIStoryboard(name: "Authenticate", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            let viewModel = LoginViewModel()
            loginViewController.viewModel = viewModel
            loginViewController.delegate = self
            navigationController.show(loginViewController, sender: self)
        }
    }
}

extension AuthenticationCoordinator: LoginViewControllerDelegate {

    func didSuccessfullyLogin() {
        delegate?.coordinatorDidAuthenticate(coordinator: self)
    }

}
