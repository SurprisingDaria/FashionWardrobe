//
//  View.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 17/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

protocol View: class

{
    // назначение презентера
    func assignPresenter (presenter: Presenter) -> Void
    
    //перезагрузка экрана
    
    func reloadData ()-> Void
    
    //включение лоадера
    func addLoader ()->Void
    
    // выключение лоадера
    
    func removeLoader () -> Void
    
    //коды ошибок интернета
    
    func handleInternetErrorCode (code: Int)-> Void

    
    
}
