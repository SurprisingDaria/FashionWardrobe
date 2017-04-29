//
//  ProfileHeader.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 17/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class ProfileHeader: ItemsListHeader
{
    var city: String
    var token: String
    var email: String
    init(city: String, token: String, email: String, authorID: String, avatarURL: String, name: String)
    
    {
        self.city = city
        self.token = token
        self.email = email
        super.init(authorID: authorID, avatarURL: avatarURL, name: name)
    }
    
    
}
