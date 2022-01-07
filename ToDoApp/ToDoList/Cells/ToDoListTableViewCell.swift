//
//  ToDoListTableViewCell.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/07.
//

import UIKit

final class ToDoListTableViewCell: UITableViewCell {
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(todo: String) {
        textLabel?.text = todo
    }
}
