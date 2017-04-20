//
//  itemsType.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

enum TypeClothes : String
{
    case sale = "Продажа"
    case exchange = "Обмен"
    case both = "Продажа/обмен"
    case none = ""
}

class ItemsType
{
    var type: TypeClothes = .none
    
    init (type: TypeClothes)
    {
        self.type = type
    }
}
