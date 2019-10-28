//
//  BaseResponse.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

protocol BaseResponse {

    var errorMsg: String? {get}

    var errorCode: String? {get}

    var success: Bool? {get}

}
