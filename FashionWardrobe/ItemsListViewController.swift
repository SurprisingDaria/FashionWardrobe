//
//  ViewController.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 11/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class ItemsListViewController: UIViewController

{
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
    @IBOutlet weak var itemsListTableView: UITableView!
   
    
    var presenter: Presenter?
    
    
    
    let kListHeaderNIB = UINib(nibName: "ListHeaderTableViewCell", bundle: nil)
    let kListHeaderReuseIdentifier = "kListHeaderReuseIdentifier"
    
    let kItemsTextNIB = UINib(nibName: "ItemsTextTableViewCell", bundle: nil)
    let kItemsTextReuseIdentifier = "kItemsTextReuseIdentifier"
    
    let kItemsTypeNIB = UINib(nibName: "ItemsTypeTableViewCell", bundle: nil)
    let kItemsTypeReuseIdentifier = "kItemsTypeReuseIdentifier"
    
    let kItemsPriceNIB = UINib(nibName: "ItemsPriceTableViewCell", bundle: nil)
    let kItemsPriceReuseIdentifier = "kItemsPriceReuseIdentifier"
    
    let kItemsDateNIB = UINib(nibName: "ItemsDateTableViewCell", bundle: nil)
    let kItemsDateReuseIdentifier = "kItemsDateReuseIdentifier"
    
    let kPhotoCollectionNIB = UINib(nibName: "ItemsPhotoCollectionTableViewCell", bundle: nil)
    let kPhotoCollectionReuseIdentifier = "kPhotoCollectionReuseIdentifier"
    

    
    
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        // задаем высоту ячейки в таблице
        itemsListTableView.rowHeight = UITableViewAutomaticDimension
        itemsListTableView.estimatedRowHeight = 300
    
    
        itemsListTableView.register(kListHeaderNIB, forCellReuseIdentifier: kListHeaderReuseIdentifier)
        itemsListTableView.register(kItemsTextNIB, forCellReuseIdentifier: kItemsTextReuseIdentifier)
        itemsListTableView.register(kItemsPriceNIB, forCellReuseIdentifier: kItemsPriceReuseIdentifier)
        itemsListTableView.register(kItemsDateNIB, forCellReuseIdentifier: kItemsDateReuseIdentifier)
        itemsListTableView.register(kPhotoCollectionNIB, forCellReuseIdentifier: kPhotoCollectionReuseIdentifier)
        itemsListTableView.register(kItemsTypeNIB, forCellReuseIdentifier: kItemsTypeReuseIdentifier)
        
  
    
    }
    
    override func viewWillAppear(_ animated: Bool)
    
    {
        if presenter == nil
        {
            DependencyInjector.obtainPresenter(view: self as! View)
        }
        
        super.viewWillAppear(animated)
        
    }
}

extension ItemsListViewController: View
{
    // назначение презентера
    func assignPresenter (presenter: Presenter) -> Void
    {
        self.presenter = presenter
        presenter.viewLoaded(view: self)
        
        itemsListTableView.dataSource = self
        itemsListTableView.delegate = self
    }
    
    //перезагрузка экрана
    
    func reloadData ()-> Void
    
    {
      itemsListTableView.reloadData()
    }
    
    //включение лоадера
    func addLoader ()->Void
    
    {
        activityIndicator.startAnimating()
    }
    
    // выключение лоадера
    
    func removeLoader () -> Void
    {
        activityIndicator.stopAnimating()
    }
    
    //коды ошибок интернета
    
    func handleInternetErrorCode (code: Int)-> Void
    
    {
        
        let alertController = UIAlertController(title: "Ошибка", message: "нет соединения с интернетом", preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
   
    
}



extension ItemsListViewController: UITableViewDelegate, UITableViewDataSource

{
    func numberOfSections(in tableView: UITableView) -> Int
    
    {
        return (presenter?.numberOfSections())!
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return (presenter?.numberOfModels(section: section))!
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        let model = presenter?.getModel(indexPath: indexPath)
        
        if model is ItemsListHeader
        {
            let cell  = itemsListTableView.dequeueReusableCell(withIdentifier: kListHeaderReuseIdentifier, for: indexPath) as! ListHeaderTableViewCell
            cell.selectionStyle = .none
            
            cell.configureSelf(model: model as! ItemsListHeader)
            return cell
        }
        if model is ItemsDate
        {
            let cell  = itemsListTableView.dequeueReusableCell(withIdentifier: kItemsDateReuseIdentifier, for: indexPath) as! ItemsDateTableViewCell
            cell.selectionStyle = .none
            cell.configureSelf(model: model as! ItemsDate)
            
            return cell
            
        }
            
        if model is ItemsListText
        {
            let cell  = itemsListTableView.dequeueReusableCell(withIdentifier: kItemsTextReuseIdentifier, for: indexPath) as! ItemsTextTableViewCell
            cell.selectionStyle = .none
            cell.configureSelf(model: model as! ItemsListText)
            
            return cell
            
        }
        
        if model is ItemsType
        {
            let cell = itemsListTableView.dequeueReusableCell(withIdentifier: kItemsTypeReuseIdentifier, for: indexPath) as! ItemsTypeTableViewCell
            
            cell.configureSelf(model: model as! ItemsType)
            
            return cell
        }
        
        if model is ItemsPrice
        {
            if (model as! ItemsPrice).type == .sale || (model as! ItemsPrice).type == .both
            {
                let cell  = itemsListTableView.dequeueReusableCell(withIdentifier: kItemsPriceReuseIdentifier, for: indexPath) as! ItemsPriceTableViewCell
                cell.selectionStyle = .none
                cell.configureSelf(model: model as! ItemsPrice)
                
                return cell
            }
        }
        
        if model is ItemsPictures
        {
            let cell = itemsListTableView.dequeueReusableCell(withIdentifier: kPhotoCollectionReuseIdentifier, for: indexPath) as! ItemsPhotoCollectionTableViewCell
            cell.selectionStyle = .none
            cell.configureSelf(photoArray: (model as! ItemsPictures).arrayPicture)
            return cell
        }
        
        let cell  = UITableViewCell()
        return cell
    }
}

