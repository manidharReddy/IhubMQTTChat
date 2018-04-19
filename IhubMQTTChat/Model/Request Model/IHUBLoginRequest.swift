//
//  IHUBLoginRequest.swift
//  IhubMQTTChat
//
//  Created by ihub on 08/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import ObjectMapper

class IHUBLoginRequest: Mappable {
    var userId:String?
    
    var password:String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId <- map[APICONSTANTS.LoginRequestKeys.userId]
       
        password <- map[APICONSTANTS.LoginRequestKeys.password]
    }
    
    
}
