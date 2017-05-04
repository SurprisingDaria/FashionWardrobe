//
//  AddPostViewController.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 03/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class AddPostViewController : UIViewController
{
    @IBOutlet weak var tableView : UITableView!
    var itemsPicture = [ItemsPicture]()
    
    let kPhotoCollectionNIB = UINib(nibName: "ItemsPhotoCollectionTableViewCell", bundle: nil)
    let kPhotoCollectionReuseIdentifier = "kPhotoCollectionReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(kPhotoCollectionNIB, forCellReuseIdentifier: kPhotoCollectionReuseIdentifier)
    }
}

extension AddPostViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: kPhotoCollectionReuseIdentifier, for: indexPath) as? ItemsPhotoCollectionTableViewCell
            cell?.configureSelf(photoArray: itemsPicture)
            cell?.selectionStyle = .none
            if let cell = cell
            {
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        else
        {
            return 60
        }
    }
}
