//
//  StorageManager.swift
//  UIAdaptivePresentation
//
//  Created by Alexey Efimov on 06.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "contact"
    
    private init() {}
    
    func save(contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: key)
    }
    
    func fetchContacts() -> [String] {
        if let contacts = userDefaults.value(forKey: key) as? [String] {
            return contacts
        }
        return []
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: key)
    }
}
