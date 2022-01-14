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
    let text: String = ""
}
