//
//  SplashViewController.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol SplashViewControllerDelegate: class {
    func showLoginScreen()
    func showMainScreen()
}

class SplashViewController: UIViewController {

    var delegate: SplashViewControllerDelegate?

    var viewModel: SplashViewModel?

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let token = UserDefaultUtils.shared.getAccessToken()
            if token == nil {
                self.delegate?.showLoginScreen()
            } else {
                self.delegate?.showMainScreen()
            }
        }
    }

}
