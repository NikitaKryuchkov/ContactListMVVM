//
//  ContactListViewController.swift
//  UIAdaptivePresentation
//
//  Created by Alexey Efimov on 04/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContact(_ contact: String)
}

class ContactListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var contacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = StorageManager.shared.fetchContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.delegate = self
    }
}

// MARK: - UITAbleViewDataSource
extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            StorageManager.shared.deleteContact(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - NewContactViewControllerDelegate
extension ContactListViewController: NewContactViewControllerDelegate {
    func saveContact(_ contact: String) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
