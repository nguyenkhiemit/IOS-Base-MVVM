//
//  LoginViewController.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginViewControllerDelegate: class {
    func didSuccessfullyLogin()
}

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!

    var delegate: LoginViewControllerDelegate?

    var viewModel: LoginViewModel?

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.text = "0342884885"
        setupBinding()
    }

    @IBAction func clickLoginButton(_ sender: Any) {
        var request = LoginRequest()
        request.phone = phoneTextField.text
        viewModel?.login(request: request)
    }

    private func setupBinding() {
        viewModel?.loading.bind(to: self.rx.isAnimating).disposed(by: disposeBag)

        viewModel?
            .errorMsg
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                (error) in
                MessageView.shared.showOnView(message: error, theme: .error)
            }).disposed(by: disposeBag)

        viewModel?.success.observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                (success) in
                self.delegate?.didSuccessfullyLogin()
                MessageView.shared.showOnView(message: "messge_login_success".localized, theme: .success)
            }).disposed(by: disposeBag)
    }
}
