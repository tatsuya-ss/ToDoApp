//
//  AdditionalToDoViewController.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/05.
//

import UIKit

protocol AdditionalToDoVCDelegate {
    func onClickedAdditionalButton()
}

final class AdditionalToDoViewController: UIViewController {
    
    @IBOutlet private weak var AdditionaltextField: UITextField!
    
    private var additionalButton: UIBarButtonItem!
    private let toDoUseCase = ToDoUseCaseImpl(
        toDoRepository: ToDoRepositoryImpl()
    )
    var delegate: AdditionalToDoVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    init() {
        super.init(nibName: String(describing: AdditionalToDoViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - setup
extension AdditionalToDoViewController {
    
    private func setupNavigation() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        additionalButton = UIBarButtonItem(title: "追加",
                                           style: .done,
                                           target: self,
                                           action: #selector(didTapAdditionalButton))
        navigationItem.rightBarButtonItem = additionalButton
    }
    
}

// MARK: - @objc
private extension AdditionalToDoViewController {
    
    @objc func didTapAdditionalButton() {
        guard let text = AdditionaltextField.text else { return }
        let toDo = ToDo(text: text,
                        order: toDoUseCase.toDos.count,
                        identifier: UUID().uuidString)
        toDoUseCase.save(toDo: toDo)
        delegate?.onClickedAdditionalButton()
        navigationController?.popViewController(animated: true)
    }
    
}
