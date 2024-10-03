//
//  UserDefaults+group.swift
//  AppStorage
//
//  Created by Brad Angliss on 02/10/2024.
//

import SwiftUI
import Combine

enum PasteboardAppStorageErrors: Error {
    case GetKeyError
}

public protocol PasteboardAppStorageProtocol {
    var pasteboardHistoryLimit: CurrentValueSubject<Int?, Never> { get }
    var isMenuBarActive: CurrentValueSubject<Bool?, Never> { get }

    func getInt(forKey key: StorageKeys) -> Int
    func getString(forKey key: StorageKeys) throws -> String
    func getBool(forKey key: StorageKeys) -> Bool

    func setValue<T: Any>(forKey: StorageKeys, value: T)

    func remove(key: StorageKeys) throws
}

public class PasteboardAppStorageGroup: PasteboardAppStorageProtocol {
    private let userDefaults = UserDefaults.group ?? UserDefaults.standard

    public init() { /* no implementation required */ }

    // TODO: Refactor to not be optional and use value from UserDefaults
    public var pasteboardHistoryLimit: CurrentValueSubject<Int?, Never> = .init(0)

    public var isMenuBarActive: CurrentValueSubject<Bool?, Never> = .init(true)

    public func getInt(forKey key: StorageKeys) -> Int {
        return userDefaults.integer(forKey: key.rawValue)
    }

    public func getString(forKey key: StorageKeys) throws -> String {
        guard let value = userDefaults.string(forKey: key.rawValue) else {
            throw PasteboardAppStorageErrors.GetKeyError
        }
        return value
    }

    public func getBool(forKey key: StorageKeys) -> Bool {
        return userDefaults.bool(forKey: key.rawValue)
    }

    public func setValue<T: Any>(forKey key: StorageKeys, value: T) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    public func remove(key: StorageKeys) throws {
        userDefaults.removeObject(forKey: key.rawValue)
    }
    
    
}
