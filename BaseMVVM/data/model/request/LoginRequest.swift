//
//  LoginRequest.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SwiftyJSON

struct LoginRequest {

    var phone: String?

    func getParams() -> [String: Any] {
        var params = [String: Any]()
        if let phone = phone {
            params["phone"] = phone
        }
        return params
    }
}
