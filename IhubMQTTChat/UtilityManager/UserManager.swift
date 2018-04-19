//
//  UserManager.swift
//  IhubMQTTChat
//
//  Created by ihub on 06/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper
class UserManager{
   static let baseUrl = APICONSTANTS.basicUrl
    
    class func loginUser(email id:String,password pwd:String,completionHandler:@escaping (AnyObject?,String?) -> Void ){
       
        let userInfo:Parameters = [APICONSTANTS.LoginRequestKeys.userId:id,APICONSTANTS.LoginRequestKeys.password:pwd]
        
        
      APIManager.requestJson(url:APICONSTANTS.basicUrl+APICONSTANTS.loginUrl , body: userInfo) { (jsonvalue,error) in
        if error == nil,let loginResponseJson = jsonvalue{
        if let ihubLoginResponseObj = Mapper<IHUBLoginResponse>().map(JSON: loginResponseJson as! [String : Any]){
            
            print("user:\(String(describing: ihubLoginResponseObj.name))")
            
            UserDefaults.standard.set(userInfo, forKey: APICONSTANTS.UserDefaultsKeys.userLoginRequest)
            UserDefaults.standard.set(ihubLoginResponseObj.toJSON(), forKey: APICONSTANTS.UserDefaultsKeys.userLoginResult)
            
            completionHandler(ihubLoginResponseObj, nil)
        }else{
            let errmsg = Mapper<APIErrorMessage>().map(JSON:loginResponseJson as! [String : Any])
            completionHandler(errmsg,error)
            }
        }else if error != nil{
            if let errinjson = jsonvalue{
            let errmsg = Mapper<APIErrorMessage>().map(JSON:errinjson as! [String : Any])
            completionHandler(errmsg,error)
            }else {
                 completionHandler(nil,error)
            }
           
        }
        }
    }
}
