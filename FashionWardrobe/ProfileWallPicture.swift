//
//  ProfileWallPicture.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 19/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ProfileWallPicture: UITableViewCell

{

    
    @IBOutlet weak var wallImage: UIImageView!
    
    func configureSelf(model: ProfileItemPicture)
    {
        wallImage.sd_setImage(with: URL(string: model.photoURL))
    }
    
}
