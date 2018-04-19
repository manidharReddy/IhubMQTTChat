//
//  IHUBMessagesTableView.swift
//  IhubMQTTChat
//
//  Created by ihub on 24/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import UIKit
import Material
class IHUBChatMessageTableView: UIViewController {
    internal var tableview:IHUBChatMessagesVC!
    internal var bar:Bar?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        
        prepareTableView()
        
        prepareTabItem()
    }
}
extension IHUBChatMessageTableView{
    internal func prepareTableView(){
        tableview = IHUBChatMessagesVC()
        view.layout(tableview).edges()
        
    }
}
extension IHUBChatMessageTableView {
    fileprivate func prepareTabItem() {
        //tabItem.frame = CGRect(x: 0, y: 100, width: (bar?.bounds.size.width)!, height: (bar?.bounds.size.height)!)
        tabItem.isDividerHidden = true
        tabItem.title = "Chat"
        tabItem.image = UIImage(named: "ic_chat_white_36pt")
        
    }
}
extension IHUBChatMessageTableView{
    func prepareCosmicBar(){
        bar = Bar(frame:view.bounds)
        bar?.prepare()
        let labelTitle = UILabel(frame: CGRect(x: view.bounds.origin.x, y: view.bounds.origin.y, width: view.bounds.size.width/3, height: 50))
        labelTitle.text = "iMedIhub"
        labelTitle.textColor = UIColor.white
        labelTitle.adjustsFontSizeToFitWidth = true
        
        //bar.leftViews = [labelTitle]
        bar?.centerViews = [labelTitle]
        bar?.backgroundColor = AppColor.init().appColor
        view.addSubview(bar!)
        
    }
}
