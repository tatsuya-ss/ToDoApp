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
    
    private let toDoUseCase = ToDoUseCaseImpl(
        toDoRepository: ToDoRepositoryImpl()
    )
    private var todos: [ToDo] {
        toDoUseCase.toDos
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        additionalButton.layer.cornerRadius = additionalButton.layer.frame.height / 2
    }
    
    @IBAction func didTapAdditionalButton(_ sender: Any) {
        let additionalToDoVC = AdditionalToDoViewController()
        additionalToDoVC.delegate = self
        navigationController?.pushViewController(additionalToDoVC, animated: true)
    }
    
    init() {
        super.init(nibName: String(describing: ToDoListViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableViewDelegate
extension ToDoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let editToDoVC = EditToDoViewController(todo: todos[indexPath.item])
        editToDoVC.delegate = self
        navigationController?.pushViewController(editToDoVC, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoListTableViewCell.identifier, for: indexPath) as? ToDoListTableViewCell else { fatalError("ToDoListTableViewCellがありません") }
        cell.configure(todoText: todos[indexPath.item].text)
        return cell
    }
    
}

// MARK: - AdditionalToDoVCDelegate
extension ToDoListViewController: AdditionalToDoVCDelegate {
    
    func onClickedAdditionalButton() {
        self.tableView.reloadData()
    }
    
}

// MARK: - EditToDoVCDelegate
extension ToDoListViewController: EditToDoVCDelegate {
    
    func onClickedEditButton() {
        self.tableView.reloadData()
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
    
    private func setupTableView() {
        tableView.register(ToDoListTableViewCell.nib,
                           forCellReuseIdentifier: ToDoListTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

}
