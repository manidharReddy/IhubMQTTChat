//
//  IHUBLoader.swift
//  IhubMQTTChat
//
//  Created by ihub on 16/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import MaterialComponents
struct IHUBLoader {
    
     static let activityIndicator = MDCActivityIndicator()
    
    static func initilizeLoader(center:CGPoint,mode:MDCActivityIndicatorMode) -> UIView{
        activityIndicator.center = center
        activityIndicator.indicatorMode = mode
        activityIndicator.radius = 5.0
        return activityIndicator
    }
   
    static func startLoader(){
     activityIndicator.startAnimating()
    }
    
    static func stopLoader(){
        activityIndicator.stopAnimating()
    }
}
