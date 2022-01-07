//
//  Identifierable.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/07.
//

import UIKit

protocol Identifierable {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension Identifierable where Self: UITableViewCell {
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
}
