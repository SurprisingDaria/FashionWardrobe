//
//  ProfileHeaderTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 19/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell

{
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userCity: UILabel!
    
    func configureSelf (model: ProfileHeader)
    {
        userAvatar.sd_setImage(with: URL(string: model.avatarURL))
        userName.text = model.name
        userCity.text = model.city
        
    }
}
