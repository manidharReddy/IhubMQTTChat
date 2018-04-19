//
//  FirebaseManager.swift
//  IhubMQTTChat
//
//  Created by ihub on 23/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import Firebase
class FirebaseManager{
    class func createUserWithEmail(withEmail: String, password: String,completionHandler:@escaping (AnyObject?,String?) -> Void ){
        Auth.auth().createUser(withEmail: withEmail, password: password) { (user, error) in
            if error != nil{
           
            }else{
                 completionHandler(user,nil)
            }
        }
    }
    
   class func loginUserWithEmail(withEmail: String, password: String,completionHandler:@escaping (AnyObject?,String?) -> Void ) {
        Auth.auth().signIn(withEmail: withEmail, password: password) { (user, error) in
            
        }

    }
    
    
}
