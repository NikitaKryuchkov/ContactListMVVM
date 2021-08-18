//
//  ContactListViewModelProtocol.swift
//  UIAdaptivePresentation
//
//  Created by Nikita Kryuchkov on 17.08.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

protocol ContactListViewModelProtocol: AnyObject {
    var contacts: [Contact] { get }
    func fetchContacts(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> ContactCellViewModelProtocol
    func removeContact(at indexPath: IndexPath)
    func saveContact(firstName: String, lastName: String, completion: @escaping () -> Void)}

class ContactListViewModel: ContactListViewModelProtocol {
    var contacts: [Contact] = []
    
    
    func fetchContacts(completion: @escaping () -> Void) {
        self.contacts = StorageManager.shared.fetchContacts()
        completion()
    }
    
    func numberOfRows() -> Int {
        contacts.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ContactCellViewModelProtocol {
        let contact = contacts[indexPath.row]
        return ContactCellViewModel(contact: contact)
    }
    
    func removeContact(at indexPath: IndexPath){
        contacts.remove(at: indexPath.row)
        StorageManager.shared.deleteContact(at: indexPath.row)
    }
    
    func saveContact(firstName: String, lastName: String, completion: @escaping () -> Void) {
        let contact = Contact(name: firstName, surname: lastName)
        contacts.append(contact)
        StorageManager.shared.save(contact: contact)
        completion()
    }
    
}


