//
//  TypeConstants.swift
//  IhubMQTTChat
//
//  Created by ihub on 06/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import UIKit
struct TypeConstants{
    
}
enum ViewControllerType{
    case IHUBLoginVC
    case ChatVC
    case IHUBChatUsers
    case IHUBTabBarController
}

enum ViewControllerIdentifiers:String{
    case LoginVC
    case Chat
    case chatusers
}

struct AppColor {
    var appColor:UIColor = UIColor.init(red: 199.0/255.0, green: 0/255.0, blue: 57.0/255, alpha: 1)
    init(appColor:UIColor) {
        self.appColor = appColor
    }
    
    init() {
        
    }
}
