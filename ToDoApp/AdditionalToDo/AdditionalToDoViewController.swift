//
//  AdditionalToDoViewController.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/05.
//

import UIKit

final class AdditionalToDoViewController: UIViewController {
    
    private var additionalButton: UIBarButtonItem!
    @IBOutlet private weak var AdditionaltextField: UITextField!
    
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
        navigationItem.title = "追加"
        
        additionalButton = UIBarButtonItem(title: "追加",
                                           style: .done,
                                           target: self,
                                           action: #selector(didTapAdditionalButton))
        navigationItem.rightBarButtonItem = additionalButton
    }
    
}

// MARK: - @objc
extension AdditionalToDoViewController {
    
    @objc private func didTapAdditionalButton() {
        navigationController?.popViewController(animated: true)
    }
    
}
