//
//  ProfileController.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 19/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    let kProfileHeaderNIB = UINib(nibName: "ProfileHeaderTableViewCell", bundle: nil)
    let kProfileHeaderReuseIdentifier = "profileHeader"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(kProfileHeaderNIB, forCellReuseIdentifier: kProfileHeaderReuseIdentifier)
    }
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kProfileHeaderReuseIdentifier, for: indexPath) as? ProfileHeaderTableViewCell
        let profile = ItemsStorage.getProfile(id: 0)[0] as! Item
        cell?.configureSelf(model: profile.contentArray[0] as! ProfileHeader)
        if let cell = cell
        {
            return cell
        }
        let defaultCell = UITableViewCell()
        return defaultCell
    }
    
    //Высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
