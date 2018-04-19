//
//  MQTTChatManager.swift
//  IhubMQTTChat
//
//  Created by ihub on 13/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
/*
import MQTTClient
class MQTTChatManager :NSObject,MQTTSessionManagerDelegate{
    private var mqttSessionManager:MQTTSessionManager?
    private var isConnected:Bool = false
    private var isDisconnected:Bool = true
    private var status:String?
    var messages:[Message]?
    private var host:String?
    private var port:Int?
    private var tls:Bool?
    private var topic:String?
    
    override init() {
        super.init()
        if self.mqttSessionManager != nil{
            mqttSessionManager = MQTTSessionManager()
            self.mqttSessionManager?.delegate = self
            messages = [Message]()
        }
        
    }
    convenience init(host:String,port:Int,tls:Bool,topic:String) {
        self.init()
        self.host = host
        self.port = port
        self.tls = tls
        self.topic = topic
        
    }
     func mqttConnection(host:String,port:Int,tls:Bool,topic:String){
        var topicApend:String = topic
        topicApend.append("/#")
        let subscriptions:[String:UInt8] = [topicApend : MQTTQosLevel.exactlyOnce.rawValue]
        self.mqttSessionManager?.subscriptions = subscriptions as [String : NSNumber]
        
        
        self.mqttSessionManager?.connect(to: host, port: port, tls: tls, keepalive: 60, clean: true, auth: false, user: nil, pass: nil, will: true, willTopic: topic, willMsg:"online".data(using: String.Encoding.utf8), willQos: MQTTQosLevel.exactlyOnce, willRetainFlag: false, withClientId: nil, securityPolicy: nil, certificates: nil, protocolLevel: MQTTProtocolVersion.version311, connectHandler: nil)
        
       // self.mqttSessionManager?.addObserver(self, forKeyPath: "state", options:NSKeyValueObservingOptions(rawValue: NSKeyValueObservingOptions.RawValue(UInt8(NSKeyValueObservingOptions.initial.rawValue) | UInt8(NSKeyValueObservingOptions.new.rawValue))), context: nil)
    }
    
    func mqttConnection(){
        var topicApend:String = self.topic!
        topicApend.append("/#")
        let subscriptions:[String:UInt8] = [topicApend : MQTTQosLevel.exactlyOnce.rawValue]
        self.mqttSessionManager?.subscriptions = subscriptions as [String : NSNumber]
        
        
        self.mqttSessionManager?.connect(to: self.host!, port: self.port!, tls: self.tls!, keepalive: 60, clean: true, auth: false, user: nil, pass: nil, will: true, willTopic: topic, willMsg:"online".data(using: String.Encoding.utf8), willQos: MQTTQosLevel.exactlyOnce, willRetainFlag: false, withClientId: nil, securityPolicy: nil, certificates: nil, protocolLevel: MQTTProtocolVersion.version311, connectHandler: nil)
        
    }
    
    
    func sendMessage(message:Message){
        let msgString:String = message.content as! String
        self.mqttSessionManager?.send(msgString.data(using: String.Encoding.utf8), topic:topic! , qos: MQTTQosLevel.atMostOnce, retain: false)
        self.messages?.append(message)
    }
    
    func mqqttDisconnected() -> Bool {
        /*
         * MQTTClient: send goodby message and gracefully disconnect
         */
        self.mqttSessionManager?.disconnect()
        return true
    }
    
    func lastConnection(){
        /*
         * MQTTClient: connect to same broker again
         */
        //self.mqttSessionManager?.connect(toLast: nil)
    }
/*
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch (self.mqttSessionManager?.state) {
        case :
            self.status = "closed"
            self.isDisconnected = true
            self.isConnected = false
            
        default:
            <#code#>
        }
    }
 */
    /*
     * MQTTSessionManagerDelegate
     */
    func handleMessage(_ data: Data!, onTopic topic: String!, retained: Bool) {
        /*
         * MQTTClient: process received message
         */
        let message = Message.init(type: .text, content:data.description , owner: .receiver, timestamp: Int(Date.timeIntervalBetween1970AndReferenceDate), isRead: true)
        self.messages?.append(message)
        print("handleMessage:\(data) on:\(topic)")
    }
    
    
}
*/



