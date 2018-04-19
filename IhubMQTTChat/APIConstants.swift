//
//  APIConstants.swift
//  MaterialDesignPractice
//
//  Created by ihub on 01/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
struct APICONSTANTS {
    public static let basicUrl = "http://159.89.168.24:8080/Maven_LIMS_170/rest/"
    
    public static let loginUrl = "loginpage/authenticate"
    
    struct LoginRequestKeys {
        public static let userId = "userId"
        public static let password = "password"
    }
    
    struct  LoginResponseKeys {
        public static let patientId = "patientId"
        public static let isFirst = "isfirst"
        public static let name = "name"
    }
    struct UserDefaultsKeys {
        public static let userLoginResult = "userLoginResult"
        public static let userLoginRequest = "userLoginRequest"
    }
    struct APIErrors {
        public static let errmsg = "message"
    }
}

