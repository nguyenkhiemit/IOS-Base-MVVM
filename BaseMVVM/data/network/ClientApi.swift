//
//  ClientApi.swift
//  IOSBaseMVVMC
//
//  Created by Nguyen on 9/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import Alamofire

enum ClientApi {
    
    case register
    
    case login
    
    case userInfo
    
    case listBooking
    
}

extension ClientApi: TargetType {

    /// The target's base `URL`.
    var baseURL: String {
        return BASE_URL
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .login:
            return "api/auth/register_otp"
        case .register:
            return "users/register-user/"
        case .userInfo:
            return "users/profile/"
        case .listBooking:
            return "orders/booking-manage/"
        }
    }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .userInfo:
            return .get
        case .listBooking:
            return .get
        }
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
    
}
