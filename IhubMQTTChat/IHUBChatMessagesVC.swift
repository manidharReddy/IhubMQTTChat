//
//  IHUBChatMessagesVC.swift
//  IhubMQTTChat
//
//  Created by ihub on 17/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import Material
import SwiftMQTT
class IHUBChatMessagesVC :UITableView{
    
    
    internal lazy var heights = [IndexPath:CGFloat]()
    private var data:[RecieverMessage]?
    
    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var tableView: UITableView!
    //MQTT Properties
    var mqttSession: MQTTSession!
    var isSended:Bool = false
    private var isConnected:Bool = false
    private var isDisconnected:Bool = true
    private var status:String?
    private var topic:String?
    
    
   
    /*
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: .zero, style: .plain)
        prepare()
    }
    */
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    init() {
        super.init(frame: .zero, style: .plain)
        prepare()
    }
    
    
    open func prepare(){
        dataSource = self
        delegate = self
        
        separatorStyle = .none
        backgroundColor = nil
        register(IHUBChatMessagesCell.self, forCellReuseIdentifier: "IHUBChatMessagesCell")
        data = [RecieverMessage]()
        self.topic = "diettopic"
        establishConnection()
    }
   
    
    
}
extension IHUBChatMessagesVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "IHUBChatMessagesCell", for: indexPath) as! IHUBChatMessagesCell
        //cell.data = data[indexPath.row]
        cell.contentLabel.text = data?[indexPath.row].message
        cell.presenterImageView.image = data?[indexPath.row].profilePic
        cell.dateLabel.text = data?[indexPath.row].date?.description
        //cell.contentLabel.text = data?[indexPath.row].recieverName!
        //cell.receiverName.text = "dietopic"
        cell.isLast = indexPath.row == data!.count - 1
        heights[indexPath] = cell.bounds.height
        
        return cell
    }
    
}

extension IHUBChatMessagesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heights[indexPath] ?? self.bounds.height
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
   
}
extension IHUBChatMessagesVC:MQTTSessionDelegate{
    //SwiftMQTT implementation
    
    func establishConnection() {
        let host = "144.76.40.143"
        let port: UInt16 = 1883
        //let clientID = self.clientID()
        
        mqttSession = MQTTSession(host: host, port: port, clientID: "ihub", cleanSession: true, keepAlive: 60, useSSL: false)
        mqttSession.delegate = self
        
        
        mqttSession.connect {(succeeded, error) -> Void in
            if succeeded {
                print("Connected!")
            }
            self.subscribeToChannel()
        }
    }
    
    func subscribeToChannel() {
        let subChannel = "diettopic/#"
        mqttSession.subscribe(to: subChannel, delivering: .atLeastOnce) {(succeeded, error) -> Void in
            if succeeded {
                print("Subscribed!")
            }
            
        }
        //IHUBLoader.stopLoader()
    }
    // MARK: - MQTTSessionDelegates
    
    func mqttSession(session: MQTTSession, received message: Data, in topic: String) {
        let string = String(data: message, encoding: .utf8)!
        //appendStringToTextView("data received on topic \(topic) message \(string)")
        print("recived msg session:\(string)")
    }
    
    
    func mqttSocketErrorOccurred(session: MQTTSession) {
        //appendStringToTextView("Socket Error")
    }
    
    func mqttDidDisconnect(session: MQTTSession) {
        //appendStringToTextView("Session Disconnected.")
    }
    
    func mqttDidReceive(message data: Data, in topic: String, from session: MQTTSession) {
        //self.fetchMessages()
        
        if isSended == true{
            isSended = false
        }else{
            let string = String(data: data, encoding: .utf8)!
            
            print("Topic Name:\(topic)")
            let msgs = RecieverMessage.init(recieverName: topic, profilePic: UIImage(named: "profile pic")!, message: string, date: Date.init())
            
            //let message = Message.init(type: .text, content:string , owner: .receiver, timestamp: Int(Date.timeIntervalBetween1970AndReferenceDate), isRead: true)
           // self.items.append(message)
            self.data?.append(msgs)
            self.reloadData()
            print("recived msg:\(string)")
           
            isSended = false
        }
    }
}

