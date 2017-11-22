//
//  PostMessageVC.swift
//  BreakPoint
//
//  Created by Fahad Rehman on 11/22/17.
//  Copyright © 2017 Codecture. All rights reserved.
//

import UIKit
import Firebase

class PostMessageVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var messageField: UITextView!
    
    @IBOutlet weak var userEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         messageField.delegate = self
        sendMessage.bindToKeyboard()
    }
    

    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var sendMessage: UIButton!
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        if messageField.text != nil && messageField.text != "Say something here..." {
            sendMessage.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageField.text, withUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendMessage.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendMessage.isEnabled = true
                    print("There was an error!")
                }
            })
        }
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
}



extension PostMessageVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}








