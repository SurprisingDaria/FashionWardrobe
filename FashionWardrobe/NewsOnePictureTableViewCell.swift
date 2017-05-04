//
//  NewsOnePictureTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 02/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

import SDWebImage

class NewsOnePictureTableViewCell: UICollectionViewCell

{
    @IBOutlet weak var imageViewPicture: UIImageView!
    
    func configureSelf( _ urlPicture: String)
    {
        imageViewPicture.sd_setImage(with: URL(string: urlPicture))
    }
    
}
