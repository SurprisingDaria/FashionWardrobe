//
//  NewsTextTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 02/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class NewsTextTableViewCell: UITableViewCell

{
    @IBOutlet weak var newsTextLabel: UILabel!
    
    func configureSelf(model: NewsText)
    {
        newsTextLabel.text = model.text
    }
}
