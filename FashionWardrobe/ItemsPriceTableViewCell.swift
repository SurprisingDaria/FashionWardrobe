//
//  ItemsPriceTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ItemsPriceTableViewCell: UITableViewCell
{

    
    @IBOutlet weak var itemPrice: UILabel!
    
    func configureSelf (model: ItemsPrice)
    
    {
        itemPrice.text = (String)(model.price)
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
}
