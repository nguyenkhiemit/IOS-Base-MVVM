//
//  BaseViewModel.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class BaseViewModel {

    lazy var provider: Provider = {
        return Provider()
    }()

    typealias RequestCompletion = ((_ success: Bool, _ error: String?, _ data: Any?) -> (Void))?

}
