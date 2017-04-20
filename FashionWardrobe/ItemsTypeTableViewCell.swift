//
//  ItemsTypeTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ItemsTypeTableViewCell: UITableViewCell


{

    @IBOutlet weak var itemsType: UILabel!
    
    func configureSelf(model:ItemsType)
    
    {
        itemsType.text = model.type.rawValue
        
    }
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    
    
}
