//
//  ViewController.swift
//  ShoppingList
//
//  Created by Paul Richardson on 15/04/2021.
//

import UIKit

class ViewController: UITableViewController {

	var shoppingList =  [String]()

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Shopping List"

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear List", style: .plain, target: self, action: #selector(clearList))

		if shoppingList.count == 0 {
			navigationItem.leftBarButtonItem?.isEnabled = false
		}

	}

	@objc func addItem() {
		let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
		ac.addTextField()
		let action = UIAlertAction(title: "OK", style: .default) { [weak ac, weak self] action in
			guard let item = ac?.textFields?[0].text, item != "" else { return }
			self?.shoppingList.insert(item, at: 0)
			let indexPath = IndexPath(row: 0, section: 0)
			self?.tableView.insertRows(at: [indexPath], with: .automatic)
			self?.navigationItem.leftBarButtonItem?.isEnabled = true
		}

		ac.addAction(action)
		present(ac, animated: true)
	}

	@objc func clearList() {
		shoppingList.removeAll(keepingCapacity: true)
		tableView.reloadData()
		navigationItem.leftBarButtonItem?.isEnabled = false
	}

	// MARK: - Table View Delegate

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return shoppingList.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
		cell.textLabel?.text = shoppingList[indexPath.row]
		return cell
	}

}

