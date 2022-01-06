//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/05.
//

import UIKit

final class ToDoListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var additionalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        additionalButton.layer.cornerRadius = additionalButton.layer.frame.height / 2
    }
    
    @IBAction func didTapAdditionalButton(_ sender: Any) {
        let additionalToDoVC = AdditionalToDoViewController()
        navigationController?.pushViewController(additionalToDoVC, animated: true)
    }
    
    init() {
        super.init(nibName: String(describing: ToDoListViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - setup
extension ToDoListViewController {
    
    private func setupNavigation() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "ToDo"
    }

}
