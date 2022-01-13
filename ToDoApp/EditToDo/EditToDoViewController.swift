//
//  EditToDoViewController.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/05.
//

import UIKit

final class EditToDoViewController: UIViewController {

    @IBOutlet private weak var editTextField: UITextField!
    
    private var editButton: UIBarButtonItem!
    private var selectedTodo: ToDo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTextField()
    }
    
    init(todo: ToDo) {
        self.selectedTodo = todo
        super.init(
            nibName: String(describing: EditToDoViewController.self),
            bundle: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - setup
extension EditToDoViewController {
    
    private func setupNavigation() {
        editButton = UIBarButtonItem(title: "編集",
                                     style: .done,
                                    target: self,
                                     action: #selector(didTapEditButton))
        navigationItem.rightBarButtonItem = editButton
    }
    
    private func setupTextField() {
        editTextField.text = selectedTodo.text
    }
    
}

// MARK: - @objc
private extension EditToDoViewController {
    
    @objc func didTapEditButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
