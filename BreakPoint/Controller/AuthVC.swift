//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Fahad Rehman on 11/21/17.
//  Copyright © 2017 Codecture. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginWithEmail(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main" , bundle: Bundle.main)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC, animated: false, completion: nil)
    }
    
    @IBAction func withFacebook(_ sender: Any) {
    }
    
    @IBAction func withGoogle(_ sender: Any) {
    }
    
}
