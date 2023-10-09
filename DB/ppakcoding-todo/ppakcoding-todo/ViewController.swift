//
//  ViewController.swift
//  ppakcoding-todo
//
//  Created by KIM Hyung Jun on 2023/10/09.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var ref: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }


}

