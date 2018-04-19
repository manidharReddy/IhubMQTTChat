//
//  IHUBChatUsers.swift
//  IhubMQTTChat
//
//  Created by ihub on 16/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents
import Material
class IHUBChatUsers : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 202.0/255.0, green: 207.0/255.00, blue: 210.0/255.0, alpha: 1.0)
        print("frame:\(super.view.frame)")
        /*
        let tab = UITabBar(frame: super.view.bounds)
        tab.items = [
            UITabBarItem(title: "Chat", image: UIImage(named: "ic_chat_white_36pt"), tag: 0),
                     UITabBarItem(title: "Calls", image: UIImage(named: "ic_phone_white"), tag: 1)]
       // tab.barStyle = .blackOpaque
        //tab.barTintColor = UIColor.blue
        //tab.selectedItem?.badgeColor = UIColor.green
        tab.itemPositioning = .fill
        tab.autoresizingMask = [.flexibleWidth,.flexibleBottomMargin]
        tab.backgroundColor = Color.indigo.accent1
        */
        
        //tab.itemWidth = (super.view.bounds.size.width/(CGFloat((tab.items?.count)!)))
 
        //prepareToolBar()
        prepaerCosmicBar()
        prepareCosmicToolBar()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension IHUBChatUsers{
    func prepareToolBar(){
        let tabbars = MDCTabBar(frame: view.bounds)
        tabbars.items = [
            UITabBarItem(title: "Chat", image: UIImage(named: "ic_chat_white_36pt"), tag: 0),
            UITabBarItem(title: "Calls", image: UIImage(named: "ic_phone_white"), tag: 1)
        ]
        tabbars.itemAppearance = .titledImages
        tabbars.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        tabbars.sizeToFit()
        
        view.addSubview(tabbars)
    }
    func prepaerCosmicBar(){
        let bar = Bar(frame:view.bounds)
        bar.prepare()
         let labelTitle = UILabel(frame: CGRect(x: view.bounds.origin.x, y: view.bounds.origin.y+5, width: view.bounds.size.width/3, height: view.bounds.size.height))
        labelTitle.text = "iMedIhub"
        labelTitle.textColor = UIColor.white
        labelTitle.adjustsFontSizeToFitWidth = true
       
       //bar.leftViews = [labelTitle]
        bar.centerViews = [labelTitle]
    bar.backgroundColor = AppColor.init().appColor
        view.addSubview(bar)
       
    }
    func prepareCosmicToolBar(){
        let tabbar = TabBar(frame: CGRect(x: view.bounds.origin.x, y: view.subviews[0].bounds.height, width: view.bounds.size.width, height: view.bounds.size.height))
        
        tabbar.isDividerHidden = true
        let itemchat = TabItem(image: UIImage(named: "ic_chat_white_36pt"))
        //itemchat.title = "Chat"
        
        let itemvideo = TabItem(image: UIImage(named: "ic_phone_white"))
        //itemvideo.title = "Video"
        tabbar.tabItems = [itemchat,itemvideo]
        tabbar.backgroundColor = AppColor.init().appColor
        tabbar.setLineColor(UIColor.white, for: .selected)
        tabbar.autoresizingMask = [.flexibleWidth,.flexibleBottomMargin]
        tabbar.tabBarStyle = .auto
        
        //view.addSubview(tabbar)
        view.addSubview(tabbar)
    
    }
    
    
}
