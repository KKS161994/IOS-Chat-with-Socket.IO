//
//  ChatMessage.swift
//  SocketIO_IOS
//
//  Created by Shashank Gupta on 03/06/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit

class ChatMessage{
    
    //MARK:Properties
    var username:String
    var message:String
    
    //MARK:Initialization
    init(username:String,message:String){
        self.username=username
        self.message=message
        
    }
}
