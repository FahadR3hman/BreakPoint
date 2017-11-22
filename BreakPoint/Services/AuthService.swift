//
//  AuthService.swift
//  BreakPoint
//
//  Created by Fahad Rehman on 11/21/17.
//  Copyright © 2017 Codecture. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String , AndPassword password: String , userCreationCompleted : @escaping (_ status : Bool , _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationCompleted(false,error)
                return
            }
            let userData = ["provider": user.providerID , "email": user.email ]
            DataService.instance.createUsers(uid: user.uid, userData: userData as Any as! Dictionary<String, Any>)
            userCreationCompleted(true,nil)
            
        }
    }
    
    func loginUser(withEmail email: String , AndPassword password: String , loginCompleted : @escaping (_ status : Bool , _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginCompleted(false,error)
                return
            }
            else {
                
                
                loginCompleted(true,nil)
            }
        }
    }
}








