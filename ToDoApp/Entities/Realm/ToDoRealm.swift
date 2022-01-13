//
//  ToDoRealm.swift
//  ToDoApp
//
//  Created by 大西玲音 on 2022/01/14.
//

import Foundation
import RealmSwift

// Realmに依存したToDoTextモデル
final class ToDoRealm: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var order: Int = 0
    @objc dynamic var identifier = UUID().uuidString

    override class func primaryKey() -> String? {
        return "identifier"
    }
}
