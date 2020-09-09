//
//  ViewController.swift
//  socketTest
//
//  Created by Dustin on 2020/09/09.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import SocketIO
import SwiftSocket

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    let client = TCPClient(address: "15.165.22.64", port: 8080)
    
    var socket: SocketIOClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func disconnetSocket(_ sender: Any) {
SocketIOManager.shared.closeConnection()
        
    }
    @IBAction func connectSocket(_ sender: Any) {
        SocketIOManager.shared.establishConnection()
//        switch client.connect(timeout: 1) {
//          case .success:
//
//           let data=client.read(1024*10)
//           if let d=data{
//            if let str=String(bytes: d, encoding: String.Encoding.utf8){
//                print(str) } }
//
//          case .failure(let error):
//            print(error.localizedDescription)
//        }
       
        
    }
    
    @IBAction func sendData(_ sender: Any) {
        SocketIOManager.shared.sendMessage(message: self.textField.text!, nickname: "ns")
        
    }


}
