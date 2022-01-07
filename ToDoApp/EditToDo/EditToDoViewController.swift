//
//  EditToDoViewController.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/05.
//

import UIKit

final class EditToDoViewController: UIViewController {

    @IBOutlet private weak var editTextField: UITextField!
    
    private var todo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    init(todo: String) {
        super.init(nibName: String(describing: EditToDoViewController.self), bundle: nil)
        self.todo = todo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - setup
extension EditToDoViewController {
    
    private func setupTextField() {
        editTextField.text = todo
    }
    
}
