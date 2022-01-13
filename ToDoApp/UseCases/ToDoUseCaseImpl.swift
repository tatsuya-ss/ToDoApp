//
//  ToDoUseCaseImpl.swift
//  ToDoApp
//
//  Created by 大西玲音 on 2022/01/14.
//

import Foundation

protocol ToDoUseCase {
    func save(toDo: ToDo)
}

final class ToDoUseCaseImpl: ToDoUseCase {
    
    private let toDoRepository: ToDoRepository
    
    init(toDoRepository: ToDoRepository) {
        self.toDoRepository = toDoRepository
    }
    
    func save(toDo: ToDo) {
        toDoRepository.create(toDo: toDo)
    }
    
}
