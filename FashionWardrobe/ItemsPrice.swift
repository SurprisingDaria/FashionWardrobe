//
//  itemsPrice.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation



class ItemsPrice
{
    var price: Int
    var type : TypeClothes = .none
    
    init(price: Int, type : TypeClothes)
    {
        self.price = price
        self.type = type
    }
}
