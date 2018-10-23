//
//  ViewController.swift
//  swipe Textfields up
//
//  Created by Dhawal Mahajan on 23/10/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //step 1:
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tap)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //step 7:
        addObservers()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //step 8:
        removeObersvers()
    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        //Step 2:
        view.endEditing(true)
    }
    
    //step 3: Add observers
    func addObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            self.keyboardWillShow(notification: notification)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (notification) in
            self.keyboardWillHide(notification: notification)
        }
    }
    
    //step 4:
    func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo, let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scroll.contentInset = contentInset
    }
    
    //step 5:
    
    func keyboardWillHide(notification: Notification) {
        scroll.contentInset = UIEdgeInsets.zero
    }
    
    //step 6:
    
    func removeObersvers() {
            NotificationCenter.default.removeObserver(self)
    }
}

