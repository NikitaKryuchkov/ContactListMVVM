//
//  ContactTableViewCell.swift
//  UIAdaptivePresentation
//
//  Created by Nikita Kryuchkov on 17.08.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    var viewModel: ContactCellViewModelProtocol! {
        didSet{
            var content = defaultContentConfiguration()
            content.text = viewModel.contactFullName
            contentConfiguration = content
        }
    }
}
