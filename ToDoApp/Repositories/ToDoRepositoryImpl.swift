//
//  ToDoRepositoryImpl.swift
//  ToDoApp
//
//  Created by 大西玲音 on 2022/01/14.
//

import Foundation

protocol ToDoRepository {
    func create(toDo: ToDo)
    func delete(toDo: ToDo)
    func update(toDo: ToDo)
    func readAll() -> [ToDo]
}

final class ToDoRepositoryImpl: ToDoRepository {
    
    private let realmManager = RealmManager()
    
    func create(toDo: ToDo) {
        let toDoRealm = ToDoRealm(toDo: toDo)
        realmManager.create(object: toDoRealm)
    }
    
    func delete(toDo: ToDo) {
        let toDoRealm = ToDoRealm(toDo: toDo)
        realmManager.delete(object: toDoRealm)
    }
    
    func update(toDo: ToDo) {
        let toDoRealm = ToDoRealm(toDo: toDo)
        realmManager.update(object: toDoRealm)
    }
    
    func readAll() -> [ToDo] {
        realmManager.readAll(type: ToDoRealm.self)
            .map { ToDo(toDoRealm: $0) }
    }
    
}

private extension ToDoRealm {
    convenience init(toDo: ToDo) {
        self.init()
        self.text = toDo.text
        self.order = toDo.order
        self.identifier = toDo.identifier
    }
}

private extension ToDo {
    init(toDoRealm: ToDoRealm) {
        self.text = toDoRealm.text
        self.order = toDoRealm.order
        self.identifier = toDoRealm.identifier
    }
}
