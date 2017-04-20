//
//  itemsTextTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ItemsTextTableViewCell: UITableViewCell


{
    
    @IBOutlet weak var itemDescription: UILabel!
    
    
    func configureSelf(model: ItemsListText)
    
    {
        itemDescription.text = model.description
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
}
