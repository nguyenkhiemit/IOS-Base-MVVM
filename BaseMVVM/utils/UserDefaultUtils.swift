//
//  UserDefaultUtils.swift
//  DrugStoreClient
//
//  Created by Nguyen on 10/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum UserDefaultsKey: String {
    case authExpires = "authExpires-key"
    case authRefreshToken = "authRefreshToken-key"
    case authScope = "authScope-key"
    case authTokenType = "authTokenType-key"
    case authAccessToken = "authAccessToken-key"
}

class UserDefaultUtils {

    static let shared = UserDefaultUtils()

    func save<T>(key: UserDefaultsKey, value: T) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }

    func get(key: UserDefaultsKey) -> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }

    func isValiAccessToken() -> Bool {
        guard let expired = get(key: .authExpires) as? Double else {
            return false
        }
        let dateFromExpired = Date(timeInterval: expired, since: Date(timeIntervalSince1970: expired))
        return fabs(dateFromExpired.timeIntervalSinceNow) > 86400
    }

    func getAccessTokenWithValidate() -> String? {
        guard let tokenType = getTokenType() else {
            return nil
        }

        guard let accessToken = getAccessToken() else {
            return nil
        }

        return "\(tokenType) \(accessToken)"
    }

    func getExpriesIn() -> TimeInterval? {
        return get(key: .authExpires) as? TimeInterval
    }

    func getRefreshToken() -> String? {
        return get(key: .authRefreshToken) as? String
    }

    func getScope() -> String? {
        return get(key: .authScope) as? String
    }

    func getTokenType() -> String? {
        return get(key: .authTokenType) as? String
    }

    func getAccessToken() -> String? {
        return get(key: .authAccessToken) as? String
    }
}
