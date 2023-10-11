//
//  TodoCell.swift
//  ppakcoding-todo
//
//  Created by KIM Hyung Jun on 2023/10/10.
//

import Foundation
import UIKit

class TodoCell: UITableViewCell {
    
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    var indexPath: IndexPath? = nil
    
    var isDoneAction: ((IndexPath, Bool) -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
        
        isDoneSwitch.addTarget(self, action: #selector(handleIsDoneSwitch(_:)), for: .valueChanged)
    }
    
    @objc fileprivate func handleIsDoneSwitch(_ sender: UISwitch) {
        print(#fileID, #function, #line, "- sender: \(sender.isOn)")
        
        if let indexPath = self.indexPath {
            isDoneAction?(indexPath, sender.isOn)
        }
    }
    
}
