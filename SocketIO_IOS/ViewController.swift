//
//  ViewController.swift
//  SocketIO_IOS
//
//  Created by Shashank Gupta on 03/06/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnJoin(sender: UIButton) {
    }
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        func bJoib(sender: AnyObject) {
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if username.text != nil {
            let destination=segue.destinationViewController as! ChatMessageTableViewController
            destination.username=username.text!
        }
        
    }

    
}

