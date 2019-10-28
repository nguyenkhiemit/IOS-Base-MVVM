//
//  LoginViewModel.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON
import Alamofire
import RxAlamofire

class LoginViewModel: BaseViewModel {

    private let disposeBag = DisposeBag()

    public let loading: PublishSubject<Bool> = PublishSubject()
    public let errorMsg: PublishSubject<String> = PublishSubject()
    public let success: PublishSubject<Bool> = PublishSubject()

    public func login(request: LoginRequest) {
        self.loading.onNext(true)
        provider.requestAPIJSON(api: .login, parameters: request.getParams()) {
            (success, message, data) -> (Void) in
            self.loading.onNext(false)
            if success, let data = data {
                let json = JSON(data)
                print("Xlogin => \(json)")
                let response = LoginResponse(json: json)
                if let success = response.success, success {
                    self.success.onNext(success)
                } else if let errorMsg = response.errorMsg {
                    self.errorMsg.onNext(errorMsg)
                }
            } else {
                if let message = message {
                    self.errorMsg.onNext(message)
                }
            }
        }
    }
}
