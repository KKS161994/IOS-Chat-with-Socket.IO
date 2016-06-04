//
//  ChatMessageTableViewController.swift
//  SocketIO_IOS
//
//  Created by Shashank Gupta on 03/06/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit
import SocketIOClientSwift

class ChatMessageTableViewController: UITableViewController {

    var username:String = ""
    @IBAction func btnSend(sender: UIButton) {
        if text.text != nil {
            let chat1=ChatMessage(username: username, message: text.text!);
            self.chats += [chat1];
            self.tableView.reloadData();
            socket.emit("chat", "iOS",text.text!)
            text.text = ""
        }
    }
    @IBOutlet weak var text: UITextField!
    let socket = SocketIOClient(socketURL: NSURL(string: "http://firsttestnode.herokuapp.com")!, options: [.Log(true), .ForcePolling(true)])
    
    
    var chats=[ChatMessage]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket.on("connect") {data, ack in
            print("socket connected")
        }
        
        socket.on("message"){ data,ack in
            print("Message")
            print(data[0]);
            let chat1=ChatMessage(username: data[0] as! String, message: data[1] as! String);
            self.chats += [chat1];
            self.tableView.reloadData();
            
            
        }
        
        
                
        socket.connect()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="ChatMessageTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChatMessageTableViewCell

        let chat=chats[indexPath.row]
        cell.Username.text=chat.username
        cell.message.text=chat.message

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
