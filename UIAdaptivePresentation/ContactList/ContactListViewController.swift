//
//  ContactListViewController.swift
//  UIAdaptivePresentation
//
//  Created by Alexey Efimov on 04/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContact(firstName: String, lastName: String)
}

class ContactListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var viewModel: ContactListViewModelProtocol! {
        didSet{
            viewModel.fetchContacts {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ContactListViewModel()
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.delegate = self
    }
}

// MARK: - UITAbleViewDataSource
extension ContactListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath) as! ContactTableViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeContact(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - NewContactViewControllerDelegate
extension ContactListViewController: NewContactViewControllerDelegate {
    func saveContact(firstName: String, lastName: String) {
        self.viewModel.saveContact(firstName: firstName, lastName: lastName) {
            self.tableView.reloadData()
        }
    }
}
