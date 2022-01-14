//
//  ToDoUseCaseImpl.swift
//  ToDoApp
//
//  Created by 大西玲音 on 2022/01/14.
//

import Foundation

protocol ToDoUseCase {
    var toDos: [ToDo] { get }
    func save(toDo: ToDo)
    func delete(toDo: ToDo)
    func update(toDo: ToDo)
}

final class ToDoUseCaseImpl: ToDoUseCase {
    
    private let toDoRepository: ToDoRepository
    
    init(toDoRepository: ToDoRepository) {
        self.toDoRepository = toDoRepository
    }
    
    var toDos: [ToDo] {
        toDoRepository.readAll()
    }
    
    func save(toDo: ToDo) {
        toDoRepository.create(toDo: toDo)
    }
    
    func delete(toDo: ToDo) {
        toDoRepository.delete(toDo: toDo)
    }
    
    func update(toDo: ToDo) {
        toDoRepository.update(toDo: toDo)
    }
    
}
