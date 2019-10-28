//
//  Provider.swift
//  IOSBaseMVVMC
//
//  Created by KhiemND on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias RequestCompletion = ((_ success: Bool, _ error: String?, _ data: Any?) -> (Void))?

class Provider {

    var alamofireManager: Alamofire.SessionManager?

    fileprivate var request: Request?

    fileprivate let networkTimeout: TimeInterval = 30.0

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = networkTimeout
        configuration.timeoutIntervalForResource = networkTimeout
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }

    fileprivate func getDefaultHeaderTypeJSON() -> [String: String] {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json; charset=UTF-8"
        if let accessToken = UserDefaultUtils.shared.getAccessTokenWithValidate() {
            headers["Authorization"] = accessToken
        }
        headers["Accept"] = "application/vnd.api+json"
        return headers
    }

    func cancel() {
        request?.cancel()
    }
}

extension Provider {
    func requestAPIJSON(api: ClientApi, parameters: [String : Any]? = nil, headers: [String : String]? = nil, encoding: ParameterEncoding? = nil, completion: RequestCompletion) {
        let url = api.baseURL + api.path
        let finalHeaders: [String : String] = {
            if let headers = headers {
                return headers
            }
            return getDefaultHeaderTypeJSON()
        }()
        let finalEncoding: ParameterEncoding = {
            if let encoding = encoding {
                return encoding
            }
            return JSONEncoding.prettyPrinted
        }()

        alamofireManager?.request(url, method: api.method, parameters: parameters, encoding: finalEncoding, headers: finalHeaders).debugLog().responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let data):
                completion?(true, nil, data)
                break
            case .failure(let error):
                completion?(false, "kDefaultInternetError".localized, nil)
                break
            }
        })
    }
}



