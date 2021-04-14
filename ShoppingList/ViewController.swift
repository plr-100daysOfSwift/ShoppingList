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

	}

	@objc func addItem() {
		
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

