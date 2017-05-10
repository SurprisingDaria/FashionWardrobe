//
//  TypeTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 09/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class TypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var imageArrow : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configSelf(typeTitle : TypeClothes) {
        self.titleLabel.text = typeTitle.rawValue
    }
    
}
