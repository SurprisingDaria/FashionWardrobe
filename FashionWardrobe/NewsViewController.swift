//
//  ViewController.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 02/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController

{


    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var newsActivityIndicator: UIActivityIndicatorView!
    
    var presenter: Presenter?
    
}
