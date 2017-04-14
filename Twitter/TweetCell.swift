//
//  TweetCell.swift
//  Twitter
//
//  Created by Arthur Burgin on 4/13/17.
//  Copyright © 2017 Arthur Burgin. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet var timestampLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var tweetLabel: UILabel!
    @IBOutlet var retweetedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}