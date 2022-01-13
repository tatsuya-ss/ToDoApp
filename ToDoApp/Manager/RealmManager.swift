//
//  RealmManager.swift
//  ToDoApp
//
//  Created by 大西玲音 on 2022/01/14.
//

import Foundation
import RealmSwift

final class RealmManager {
    
    private var realm = try! Realm()
    
    func create<T: Object>(object: T) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func update<T: Object>(object: T) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func delete<T: Object>(object: T) {
        let identifier = object.value(forKey: .identifier) as! String
        let object = realm.object(ofType: T.self,
                                  forPrimaryKey: identifier) ?? T()
        try! realm.write {
            realm.delete(object)
        }
        setupOrder(type: T.self)
    }
    
    func deleteAll<T: Object>(type: T.Type) {
        let object = realm.objects(type.self)
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func readAll<T: Object>(type: T.Type,
                            byKeyPath: String? = .order) -> [T] {
        let objects: Results<T> = {
            if byKeyPath == nil {
                return realm.objects(T.self)
            } else {
                return realm.objects(T.self).sorted(byKeyPath: .order,
                                                    ascending: true)
            }
        }()
        return objects.map { $0 }
    }
    
    private func setupOrder<T: Object>(type: T.Type) {
        let objects = RealmManager().readAll(type: type)
        objects.enumerated().forEach { index, object in
            try! realm.write {
                object.setValue(index, forKey: .order)
            }
            RealmManager().update(object: object)
        }
    }
    
}

private extension String {
    
    enum Constant: String {
        case order
        case identifier
    }
    
    static var order: String {
        return Constant.order.rawValue
    }
    
    static var identifier: String {
        return Constant.identifier.rawValue
    }
    
}
