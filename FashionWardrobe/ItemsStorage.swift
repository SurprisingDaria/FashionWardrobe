//
//  ItemsStorage.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 13/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class ItemsStorage
    
    

{
    static var outArray = NSMutableArray()
    
    private static let names = ["Филипп", "Лукас", "Евгений", "Елена", "Мартин", "Снежана", "Анжела", "Маргарита", "Тарзан", "Марк", "Эмма", "Изабелла", "Алонсо", "Арни", "Кристиан", "Лев", "Аля", "Надин", "Марта", "Севастьян" ]
    
    private static let citys = ["Москва", "Питер", "Рязань", "Москва", "Воронеж", "Ростов", "Калиниград", "Москва", "Хабаровск", "Москва", "Москва", "Питер", "Питер" , "Питер" , "Питер" , "Питер","Воронеж","Воронеж","Воронеж","Питер","Питер"]
   
    private static let prices = [100, 1000, 6500, 3400, 2200, 1150, 1900, 150000, 5000, 2000, 3000, 1000, 4690, 5670, 8990, 1490, 3450, 3990, 9990, 100001]
    
    private static let dates  = ["4 апреля 2017","5 апреля 2017", "6 апреля 2017", "7 апреля 2017", "8 апреля 2017", "9 апреля 2017", "10 апреля 2017", "23 марта 2017", "11 апреля 2017", "4 апреля 2017", "5 апреля 2017", "9 апреля 2017", "10 апреля 2017", "11 апреля 2017", "1 апреля 2017", "29 марта 2017", "5 апреля 2017", "8 апреля 2017", "9 апреля 2017", "30 марта 2017"]
    
    private static let descriptions = ["комбинезон", "юбка самошитая", "юбка Zara", "юбка Gucci", "юбка Guess", "куртка Boss", "носки", "футболка Superman", "леггинсы", "куртка осенняя", "кожаная куртка", "летние брюки", "колье Zara", "серьги золотые", "домашний комплект", "кольцо", "шорты", "юбка кожаная", "комбинезон рабочий", "свитер с оленями"]
    
    private static let urlPhotos = ["https://pp.userapi.com/c639230/v639230023/13f29/5E8Eg2ZaUOo.jpg", "https://pp.userapi.com/c639230/v639230023/13f51/E8EhMyqWG_I.jpg", "https://pp.userapi.com/c639230/v639230023/13f29/5E8Eg2ZaUOo.jpg", "https://cdn.aizel.ru/i/427x640/147571.jpg", "https://pp.userapi.com/c639230/v639230023/13f29/5E8Eg2ZaUOo.jpg", "https://pp.userapi.com/c639230/v639230023/13ee3/f4bn6q17w9E.jpg", "https://pp.userapi.com/c639230/v639230023/13ee3/f4bn6q17w9E.jpg", "https://pp.userapi.com/c639230/v639230023/13ee3/f4bn6q17w9E.jpg", "https://pp.userapi.com/c639230/v639230023/13ee3/f4bn6q17w9E.jpg", "https://pp.userapi.com/c639230/v639230023/13ee3/f4bn6q17w9E.jpg", "https://pp.userapi.com/c639230/v639230023/13f29/5E8Eg2ZaUOo.jpg", "http://www.newwoman.ru/pic35/000000-00-977-7740777770099999999999999999996950.jpg", "https://static.baza.farpost.ru/v/1376907540240_bulletin", "https://sokolov.ru/ru/images/jewelry/500/724343.jpg", "http://odezhda-doma.ru/components/com_virtuemart/shop_image/product/ZHenskiy_domashniy__kostum_s_bambukovim_voloknom_Laete_20156_izumrudniy_20140317151016.jpg", "https://diamant-online.ru/upload/iblock/804/80467a0142a483dd8459378553b9f19f.jpg", "http://best-guide.ru/wp-content/uploads/2013/04/Снимок-экрана-2013-04-28-в-20.52.18.png", "http://livelive.ru/wp-content/uploads/2016/01/1793.jpg", "http://www.spets-odezhda.ru/imagesmag/5/59528x480.jpg", "https://img.artlebedev.ru/everything/brain/files/0/5/056670124228265506973-1.jpg" ]
    
    private static let urlAvatarPhotos = ["https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c630829/v630829269/3d59a/tRLBTYi89Mw.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c409016/v409016941/62f/RJ3YXTB2Ucw.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg","https://pp.userapi.com/c10664/u7484624/a_38d14c29.jpg"]

    private static let types = ["продажа", "продажа", "продажа", "продажа", "продажа", "продажа/обмен", "продажа", "продажа", "продажа", "продажа", "продажа/обмен", "продажа/обмен", "обмен", "продажа/обмен", "продажа", "продажа", "продажа", "продажа", "продажа", "обмен"]
    
    class func generateData () -> NSArray
    {
     
        outArray = []
        
        for i in 0..<20
        {
            let name = names[i]
            let date  = dates[i]
            let description = descriptions[i]
            let price = prices[i]
            let photoURL = urlPhotos[i]
            let type = types[i]
            var typeResult : TypeClothes = .none
            
            if type == "продажа"
            {
                typeResult = .sale
            }
            else if type == "продажа/обмен"
            {
                typeResult = .both
            }
            else if type == "обмен"
            {
                typeResult = .exchange
            }
            
            let item  = Item(id:(i))
            
            let userModel = ItemsListHeader(authorID: "", avatarURL: urlAvatarPhotos[i], name: name)
            let itemDate = ItemsDate(publishDate: date)
            let itemDescription = ItemsListText(description: description)
            let image = ItemsPicture(id: "", photoURL: photoURL)
            let images = ItemsPictures(arrayPicture: [image, image])
            let itemType = ItemsType(type: typeResult)
            let itemPrice = ItemsPrice(price: price, type : typeResult)
            
            item.contentArray.add(userModel)
            item.contentArray.add(images)
            item.contentArray.add(itemDescription)
            item.contentArray.add(itemType)
            if typeResult == .sale || typeResult == .both
            {
                item.contentArray.add(itemPrice)
            }
            item.contentArray.add(itemDate)
            
            outArray.add(item)
         
            
        }
        
        return outArray
        
    }
    
    class func getProfile(id : Int)-> NSArray
    {
        outArray = []
        let name = names[id]
        let city  = citys[id]
        let avatarURL = urlAvatarPhotos[id]
        
        let item = Item(id : id)
        let profile = ProfileHeader(city: city,token: "", email: "", authorID: "\(id)", avatarURL: avatarURL, name: name)
        item.contentArray.add(profile)
        
        outArray.add(item)
        return outArray
    }
    
    
    class func object (indexPath: IndexPath) -> Any
    {

        
        let itemsObject = outArray[indexPath.section] as! Item
        let itemsContent = itemsObject.contentArray[indexPath.row]
        return itemsContent
        
        
        
    }
    
   
}
