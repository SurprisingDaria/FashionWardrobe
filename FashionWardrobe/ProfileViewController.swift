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
    
    @IBOutlet weak var registrationView: UIView!
    
    
    let kProfileHeaderNIB = UINib(nibName: "ProfileHeaderTableViewCell", bundle: nil)
    let kProfileHeaderReuseIdentifier = "profileHeader"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(kProfileHeaderNIB, forCellReuseIdentifier: kProfileHeaderReuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool)
    
    {
        super.viewWillAppear(animated)
        
        if UserStorage.profile == nil
        {
            registrationView.isHidden = false
        }
        else
        {
            registrationView.isHidden = true
        }
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
