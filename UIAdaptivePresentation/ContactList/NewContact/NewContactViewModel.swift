//
//  NewContactViewModel.swift
//  UIAdaptivePresentation
//
//  Created by Nikita Kryuchkov on 17.08.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

protocol NewContactViewModelProtocol {
    var firstNameField: String { get set }
    var statusButtonDone: Bool { get }
}

class NewContactViewModel: NewContactViewModelProtocol {
    var firstNameField = ""
    var statusButtonDone: Bool {
        get {
            !firstNameField.isEmpty ? true : false
        }
    }
    
}
