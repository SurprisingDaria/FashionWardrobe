//
//  itemsPicture.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation
import UIKit

class ItemsPicture

{

    var id: String
    var photoURL: String
    var image : UIImage?
    
    init (id: String, photoURL: String)
    {
        self.id = id
        self.photoURL = photoURL
    }
}
