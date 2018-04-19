//
//  RecieverMessage.swift
//  IhubMQTTChat
//
//  Created by ihub on 19/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import UIKit
class RecieverMessage{
    var recieverName:String?
    var profilePic:UIImage?
    var message:String?
    var date:Date?
    
    init(recieverName:String,profilePic:UIImage,message:String,date:Date) {
        self.profilePic = profilePic
        self.recieverName = recieverName
        self.date = date
        self.message = message
    }
}
