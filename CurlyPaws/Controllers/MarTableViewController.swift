//
//  MarTableViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 14.11.24.
//

import UIKit

class MarTableViewController: UITableViewController {
    
    var dogDataManager: IDogDataManageable?
    
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomDogCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogDataManager?.getMarkedDogs().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomDogCell else {
            return UITableViewCell()
        }
        
        if let dog = dogDataManager?.getMarkedDogs()[indexPath.row] {
            cell.configure(dogModel: dog)
            
            cell.action = actionButton
        }
        return cell
    }
    
    private func actionButton(cell: UITableViewCell) {
        if let indexPath = self.tableView.indexPath(for: cell ),
           let dog = self.dogDataManager?.getMarkedDogs()[indexPath.row],
           let manager = self.dogDataManager {
            manager.toggleMarkForDog(dog)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
