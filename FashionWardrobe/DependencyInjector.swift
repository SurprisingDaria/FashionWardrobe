//
//  DependencyInjector.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 17/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class DependencyInjector

{
    
    //получение презентера, первым загружается вью, инициалиирует все
    class func obtainPresenter (view: View)
        
    {
        var presenter: Presenter?
        
        //проверка типа вью, на основе этого дается соответствующий презентер
        if view is  ItemsListViewController
        {
            presenter  = ItemsListPresenter ()
        }
        else if view is NewsViewController
        {
            presenter = NewsPresenter()
        }
        
        if presenter != nil
        {
            view.assignPresenter(presenter: presenter!)
            
        }
    }

}
