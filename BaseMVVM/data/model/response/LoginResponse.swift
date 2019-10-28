//
//  LoginResponse.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LoginResponse: BaseResponse {

    var errorMsg: String?

    var errorCode: String?

    var success: Bool?

    var data: LoginData?

    init(json: JSON) {
        errorMsg = json["error_msg"].string
        errorCode = json["error_code"].string
        success = json["success"].bool
        data = LoginData(json: json["data"])
    }
}

struct LoginData {
    var phone: String?

    init(json: JSON) {
        phone = json["phone"].string
    }
}
