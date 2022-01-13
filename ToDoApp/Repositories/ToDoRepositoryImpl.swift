//
//  ToDoRepositoryImpl.swift
//  ToDoApp
//
//  Created by 大西玲音 on 2022/01/14.
//

import Foundation

protocol ToDoRepository {
    func create(toDo: ToDo)
}

final class ToDoRepositoryImpl: ToDoRepository {
    
    private let realmManager = RealmManager()
    
    func create(toDo: ToDo) {
        let toDoRealm = ToDoRealm(toDo: toDo)
        realmManager.create(object: toDoRealm)
    }
    
}

private extension ToDoRealm {
    convenience init(toDo: ToDo) {
        self.init()
        self.text = toDo.text
    }
}

private extension ToDo {
    init(toDoRealm: ToDoRealm) {
        self.text = toDoRealm.text
    }
}
