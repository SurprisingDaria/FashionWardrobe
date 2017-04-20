//
//  ItemsDateTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 12/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ItemsDateTableViewCell: UITableViewCell

{

    
    @IBOutlet weak var date: UILabel!
    
    func configureSelf(model: ItemsDate)
    {
        date.text = model.publishDate
    }
    
    
    
    
    override func awakeFromNib()
    
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
