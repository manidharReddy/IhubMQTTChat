//
//  IHUBLoginResponse.swift
//  IhubMQTTChat
//
//  Created by ihub on 08/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import ObjectMapper

class IHUBLoginResponse: Mappable {
    var patientId:String?
    var isfirst:Bool?
    var name:String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        patientId <- map[APICONSTANTS.LoginResponseKeys.patientId]
        isfirst <- map[APICONSTANTS.LoginResponseKeys.isFirst]
        name <- map[APICONSTANTS.LoginResponseKeys.name]
    }
    
    
}
