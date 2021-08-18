//
//  NewContactViewController.swift
//  UIAdaptivePresentation
//
//  Created by Alexey Efimov on 04/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    var viewModel: NewContactViewModelProtocol!
    
    var delegate: NewContactViewControllerDelegate!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewContactViewModel()
        firstNameTextField.addTarget(
            self,
            action: #selector(firstNameTextFieldDidChanged),
            for: .editingChanged
        )
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveAndExit()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc private func firstNameTextFieldDidChanged() {
        viewModel.firstNameField = firstNameTextField.text
        doneButton.isEnabled = viewModel.textFieldDidChange() 
    }
    
    private func saveAndExit() {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        delegate.saveContact(firstName: firstName, lastName: lastName)
        dismiss(animated: true)
    }
}
