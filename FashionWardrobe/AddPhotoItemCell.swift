//
//  AddPhotoItemCellCollectionViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 03/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit
import SDWebImage

class AddPhotoItemCell: UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView.layer.cornerRadius = self.imageView.frame.width  / 2
    }
    
    func configCell(imageURL : String, image : UIImage?) {
        if let image = image {
            self.imageView.image = image
        } else {
            self.imageView.sd_setImage(with: URL(string: imageURL))
        }
    }
}
