//
//  ViewController.swift
//  ios-push-ex
//
//  Created by KIM Hyung Jun on 10/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txvLogs: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: .refreshTextView, object: nil)
    }
    
    func refreshTextView() {
        let newsList = UserDefaults.standard.array(forKey: "NewsList") as? [String] ?? [String]()
        txvLogs.text = newsList.reversed().joined(separator: "\n\n")
    }
    
    @objc func didReceiveNotification(_ notification: Notification) {
        refreshTextView()
    }

}

