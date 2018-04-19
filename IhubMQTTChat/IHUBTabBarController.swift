//
//  IHUBTabBarController.swift
//  IhubMQTTChat
//
//  Created by ihub on 17/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import Material
class IHUBTabBarController : TabsController{
    var bar:Bar?
    override func prepare() {
        super.prepare()
      
        tabBar.setLineColor(Color.white, for: .selected)
        tabBar.setTabItemsColor(Color.white, for: .normal)
        tabBar.setTabItemsColor(Color.white, for: .selected)
        tabBar.setTabItemsColor(Color.white, for: .highlighted)
        
        tabBar.isDividerHidden = true
        //tabBar.lineAlignment = .top
        tabBar.backgroundColor = AppColor.init().appColor
        tabBarAlignment = .top
         
        
    }
    
    
}

