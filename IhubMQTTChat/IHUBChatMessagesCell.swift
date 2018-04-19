//
//  IHUBChatMessagesCell.swift
//  IhubMQTTChat
//
//  Created by ihub on 17/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import Material
class IHUBChatMessagesCell : TableViewCell{
    //var profilePic:UIImageView?
    
    //var message:String?
    //var date:Date?
    
    
    private var spacing: CGFloat = 10
    
    public var isLast = false
    
    public lazy var card: PresenterCard = PresenterCard()
    
    private var toolbar: Toolbar!
    private var moreButton: IconButton!
    
    public var presenterImageView:UIImageView!
    
    public var receiverName:UILabel!
    public var contentLabel:UILabel!
     public var isOnline:UIImageView!
    
    private var bottomBar:Bar!
    private var dateFormatter:DateFormatter!
    public var dateLabel:UILabel!
   private var favoriteButton:IconButton!
    private var shareButton:IconButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        card.frame.origin.x = 10
        card.frame.origin.y = 10
        card.frame.size.width = bounds.width - 20
        
        
        frame.size.height = card.bounds.height + 10
    }
    override func prepare() {
        super.prepare()
        
        layer.rasterizationScale = Screen.scale
        layer.shouldRasterize = true
        
        pulseAnimation = .none
        backgroundColor = nil
        prepareDateLabel()
        prepareMoreButton()
        prepareToolbar()
        prepareFavoriteButton()
        prepareShareButton()
        preparePresenterImageView()
        prepareContentLabel()
        prepareBottomBar()
        preparePresenterCard()
        
    }
    
    private func prepareDateFormatter(){
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    
    private func prepareMoreButton(){
        moreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.blueGrey.base)
    }
    private func prepareFavoriteButton(){
        favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
    }
    private func prepareShareButton(){
        shareButton = IconButton(image: Icon.share, tintColor: Color.blueGrey.base)
    }
    
    private func prepareToolbar(){
        toolbar = Toolbar()
        toolbar.heightPreset = .xlarge
        toolbar.contentEdgeInsetsPreset = .square3
        toolbar.titleLabel.textAlignment = .left
        toolbar.detailLabel.textAlignment = .left
        toolbar.rightViews = [moreButton]
    }
    private func preparePresenterImageView(){
        presenterImageView = UIImageView()
        presenterImageView.contentMode = .scaleAspectFit
        
    }
    private func prepareContentLabel(){
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.font = RobotoFont.regular(with: 14)
    }
    private func prepareBottomBar(){
        bottomBar = Bar()
        bottomBar.heightPreset = .xlarge
        bottomBar.contentEdgeInsetsPreset = .square3
        bottomBar.centerViews = [dateLabel]
        bottomBar.leftViews = [favoriteButton]
        bottomBar.rightViews = [shareButton]
        bottomBar.dividerColor = Color.grey.lighten2
    }
    private func prepareDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = RobotoFont.regular(with: 12)
        dateLabel.textColor = Color.blueGrey.base
        dateLabel.textAlignment = .center
    }
    private func preparePresenterCard() {
        card.toolbar = toolbar
        card.presenterView = presenterImageView
        card.contentView = contentLabel
        
        card.contentViewEdgeInsetsPreset = .square3
        card.contentViewEdgeInsets.bottom = 5
        card.bottomBar = bottomBar
        card.depthPreset = .none
        
        contentView.addSubview(card)
    }
}
