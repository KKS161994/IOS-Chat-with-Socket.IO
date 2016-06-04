//
//  ChatMessageTableViewCell.swift
//  SocketIO_IOS
//
//  Created by Shashank Gupta on 03/06/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
