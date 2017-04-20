//
//  itemsListHeader.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class ItemsListHeader

{
    var  authorID : String
    var  avatarURL: String
    var  name: String
    
    init(authorID : String, avatarURL: String, name: String)
    {
        self.authorID = authorID
        self.avatarURL = avatarURL
        self.name = name
    }

    
    
}
