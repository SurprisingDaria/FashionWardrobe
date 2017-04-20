//
//  ItemsListPresenter.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 17/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class ItemsListPresenter: Presenter

{
    var dataSource = NSMutableArray()
    
    weak var view: View?
    
    //сработала вью лоадед, идем за моделями
    
    
    func viewLoaded (view: View) -> Void
    
    {
        self.view = view
        view.addLoader()
        getData()
        
        
    }
    
    
    // количество секций
    
    
    func numberOfSections ()-> Int
    
    {
        return dataSource.count
    }
    
    // количество моделей в секции
    
    func numberOfModels (section : Int) -> Int
    
    {
        let itemObject = dataSource[section] as! Item
        return itemObject.contentArray.count
    }
    
    // получение моделей
    
    func getModel (indexPath: IndexPath) -> Any
    {
        let itemObject = dataSource[indexPath.section] as! Item
        let contentObject = itemObject.contentArray[indexPath.row]
        return contentObject
   }
    
  
    private func getData ()
    
    {
        
        DispatchQueue.main.async
        {
            
        
        self.view?.removeLoader()
        self.dataSource.addObjects(from: ItemsStorage.generateData() as! [Item])
        self.view?.reloadData()
        
        }
        
        
    }
}
