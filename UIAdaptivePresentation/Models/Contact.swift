//
//  Contact.swift
//  UIAdaptivePresentation
//
//  Created by Alexey Efimov on 07.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

struct Contact: Codable {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
