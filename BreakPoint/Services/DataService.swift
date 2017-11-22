//
//  DataService.swift
//  BreakPoint
//
//  Created by Fahad Rehman on 11/21/17.
//  Copyright © 2017 Codecture. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    static let instance = DataService()
    
    private var _Base_Ref = DB_Base
    private var _Base_users = DB_Base.child("users")
    private var _Base_groups = DB_Base.child("groups")
    private var _Base_feed = DB_Base.child("feed")
    
    var Base_Ref : DatabaseReference {
        return _Base_Ref
    }
    var Base_Users : DatabaseReference {
        return _Base_users
    }
    var Base_Groups : DatabaseReference {
        return _Base_groups
    }
    var Base_Feed : DatabaseReference {
        return _Base_feed
    }
    
    func createUsers (uid: String , userData : Dictionary<String , Any>) {
        Base_Users.child(uid).updateChildValues(userData) // adding values to the users table
    }
    
    func uploadPost (withMessage message: String , withUID uid:String , withGroupKey groupKey: String? , sendComplete : @escaping (_ status :Bool) -> () ) {
        if groupKey != nil {
            //send to the groups
        } else {
            Base_Feed.childByAutoId().updateChildValues(["message": message , "sender":uid ])
            sendComplete(true)
        }
    }
}













