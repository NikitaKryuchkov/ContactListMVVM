//
//  CoursCellViewModel.swift
//  UIAdaptivePresentation
//
//  Created by Nikita Kryuchkov on 17.08.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

protocol ContactCellViewModelProtocol {
    var contactFullName: String { get }
    init(contact: Contact)
}

class ContactCellViewModel: ContactCellViewModelProtocol {
    var contactFullName: String {
        contact.name
    }
    
    private let contact: Contact
    
    required init(contact: Contact) {
        self.contact = contact
    }
}
