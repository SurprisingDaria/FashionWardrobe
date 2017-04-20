//
//  listHeaderTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit
import SDWebImage

class ListHeaderTableViewCell: UITableViewCell

{

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureSelf (model: ItemsListHeader)
    {
        avatarImageView.sd_setImage (with: URL (string: model.avatarURL))
        nameLabel.text = model.name
    }
}
