//
//  APIErrorMessage.swift
//  IhubMQTTChat
//
//  Created by ihub on 08/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import ObjectMapper

class APIErrorMessage : Mappable{
    var message:String?
    required init?(map: Map) {
        
    }
     func mapping(map: Map) {
        message <- map[APICONSTANTS.APIErrors.errmsg]
    }
}
