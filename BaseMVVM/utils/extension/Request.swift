//
//  Request.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire

extension Request {

    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }

}

