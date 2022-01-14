//
//  ToDoListTableViewCell.swift
//  ToDoApp
//
//  Created by 坂本龍哉 on 2022/01/07.
//

import UIKit

extension ToDoListTableViewCell: Identifierable { }

final class ToDoListTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(todoText: String) {
        textLabel?.text = todoText
    }
}
