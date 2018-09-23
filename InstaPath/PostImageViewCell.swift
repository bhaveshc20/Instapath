//
//  PostImageViewCell.swift
//  InstaPath
//
//  Created by Bhavesh on 9/23/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostImageViewCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    
    var instagramPost: Post! {
        didSet {
            self.photoView.file = instagramPost.media
            self.photoView.loadInBackground()
            self.captionLabel.text = instagramPost.caption
            self.timestampLabel.text = instagramPost.createdAt?.description
            self.userLabel.text = instagramPost.author.username
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
