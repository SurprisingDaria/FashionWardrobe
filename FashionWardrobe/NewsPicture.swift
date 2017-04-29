//
//  NewsPicture.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 25/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class NewsPicture
{
    var id: String
    var photoURL: String
    var date: String
    init (id: String, photoURL: String,date: String)
    
    {
        self.id = id
        self.photoURL = photoURL
        self.date = date
        
    }
}
