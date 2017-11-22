//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Fahad Rehman on 11/21/17.
//  Copyright © 2017 Codecture. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailField.delegate = self
        passwordField.delegate = self
    }

  
    @IBAction func Login(_ sender: Any) {
        guard let email = emailField.text , emailField.text != ""  else {
            return
        }
        guard let pass = passwordField.text , passwordField.text != "" else {
            return
        }
        AuthService.instance.loginUser(withEmail: email, AndPassword: pass) { (success, error) in
            if (success) {
                 print("Logged In Successfully")
                self.dismiss(animated: true, completion: nil)
            } else {
                print(error?.localizedDescription as Any)
            }
            
            AuthService.instance.registerUser(withEmail: email, AndPassword: pass, userCreationCompleted: { (success, registerError) in
                if (success) {
                    AuthService.instance.loginUser(withEmail: email, AndPassword: pass, loginCompleted: { (success, nil) in
                        print("Logged In Successfully")
                        self.dismiss(animated: true, completion: nil)
                    })
                } else {
                    print(error?.localizedDescription as Any)
                }
            })
        }
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func Dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension LoginVC : UITextFieldDelegate {
    
}
