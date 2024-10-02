//
//  UserDefaults+group.swift
//  AppStorage
//
//  Created by Brad Angliss on 02/10/2024.
//

import SwiftUI

enum AppStorageErrors: Error {
    case GetKeyError
}

public protocol AppStorageProtocol {
    func get(key: String) throws -> Int
    func get(key: String) throws -> String

    func setValue(forKey: String, value: String)

    func remove(key: String) throws
}

public class AppStorage: AppStorageProtocol {
    private let userDefaults = UserDefaults.group ?? UserDefaults.standard
    
    public func get(key: String) throws -> Int {
        return userDefaults.integer(forKey: key)
    }

    public func get(key: String) throws -> String {
        guard let value = userDefaults.string(forKey: key) else {
            throw AppStorageErrors.GetKeyError
        }
        return value
    }

    public func setValue<T: Any>(forKey key: String, value: T) {
        userDefaults.set(value, forKey: key)
    }
    
    public func remove(key: String) throws {
        userDefaults.removeObject(forKey: key)
    }
    
    
}
