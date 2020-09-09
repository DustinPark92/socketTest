//
//  Socket.swift
//  socketTest
//
//  Created by Dustin on 2020/09/09.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    
    static let shared = SocketIOManager()
    var manager = SocketManager(socketURL: URL(string: "15.165.22.64:8080")!,
                                config: [.log(true),
                                         .compress])
    var socket: SocketIOClient!
    var message = "connect:::1"
    override init() {
        super.init()
        
        
        
        
        socket = self.manager.socket(forNamespace: "/websocket")
        socket.on(message) { (data, ack) in
            print(data)
        }
//        socket.on(clientEvent: .connect) {data, ack in
//            print("socket connected")
//        }

//        socket.on("websocket") { dataArray, ack in
//            print(dataArray) }

       
        
    }
    func establishConnection() {
        socket.connect()
        
    }
    func closeConnection() {
        socket.disconnect()
        
    }
    
    func sendMessage(message: String, nickname: String) {
        socket.emit("event", ["message" : "This is a test message"])
        socket.emit("event1", [["name" : "ns"], ["email" : "@naver.com"]])
        socket.emit("event2", ["name" : "ns", "email" : "@naver.com"])
        socket.emit("msg", ["nick": nickname, "msg" : message]) }
    
}
