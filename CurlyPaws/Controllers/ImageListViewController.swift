//
//  ImageListViewController.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 13.11.24.
//

import UIKit

class ImageListViewController: UIViewController {
    
    var dogDataManager: IDogDataManageable?
    
    private let tableView = UITableView()
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - UITableViewDataSource
extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogDataManager?.dogs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if let dog = dogDataManager?.dogs[indexPath.row] {
            var configuration = UIListContentConfiguration.cell()
            configuration.text = dog.description
            configuration.image = UIImage(named: dog.imageName)
            configuration.imageProperties.maximumSize = CGSize(width: 60, height: 60)
            configuration.imageProperties.reservedLayoutSize = CGSize(width: 60, height: 60)
            cell.contentConfiguration = configuration
            
            cell.accessoryType = dog.isMark ? .checkmark : .none
        }
        
        return cell
    }
}


//MARK: - UITableViewDelegate
extension ImageListViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        let markAction = UIContextualAction(
            style: .normal, title: "Mark") { [weak self] _, _, completion in
                guard let self = self else { return }
                
                self.dogDataManager?.toggleMark(at: indexPath.row)
                
                tableView.reloadRows(at: [indexPath], with: .automatic)
                
                completion(true)
            }
        
        markAction.backgroundColor = .systemGreen
        
        let deleteAction = UIContextualAction(
            style: .destructive, title: "Delete") { _, _, completion in
                self.dogDataManager?.dogs.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                completion(true)
            }
        
        deleteAction.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, markAction])
        return configuration
    }
}

// MARK: - Setup View
private extension ImageListViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
        setupLayout()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - Setup Layout
extension ImageListViewController {
    private func setupLayout() {
        view.disableAutoresizingMasks(
            for: tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
    
