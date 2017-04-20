//
//  ItemPhotoTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 12/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ItemPhotoTableViewCell: UICollectionViewCell


{

    @IBOutlet weak var itemPicture: UIImageView!
    
    func configureSelf(_ urlPhoto : String)
    {
        itemPicture.sd_setImage(with: URL(string: urlPhoto))
    }
    
        
}
