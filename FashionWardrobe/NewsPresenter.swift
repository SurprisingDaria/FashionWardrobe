//
//  NewsPresenter.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 02/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class NewsPresenter : Presenter
    
{
    var dataSource = NSMutableArray()
    
    weak var view: View?
    
    
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
    
    let newsObject = dataSource[section] as! News
    
    return newsObject.contentArray.count
        
    }
    
    // получение моделей
    
    func getModel (indexPath: IndexPath) -> Any
    
    {
        let newsObject = dataSource[indexPath.section] as! News
        let newsContent  = newsObject.contentArray[indexPath.row]
        return newsContent
    }
    
    private func getData()
    
    {
        NewsManager.getNews(success: { (news) in
            
            DispatchQueue.main.async
            {
            
            self.view?.removeLoader()
            self.dataSource.addObjects(from: (news) as! [News])
            self.view?.reloadData()
            }
       
            
            }, failure: { [weak self] code in

            DispatchQueue.main.async {

            self?.view?.removeLoader()
            }
    })
    }
}
