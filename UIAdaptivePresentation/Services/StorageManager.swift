//
//  StorageManager.swift
//  UIAdaptivePresentation
//
//  Created by Nikita Kryuchkov on 17.08.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "contact"
    
    private init() {}
    
    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.object(forKey: key) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
}
