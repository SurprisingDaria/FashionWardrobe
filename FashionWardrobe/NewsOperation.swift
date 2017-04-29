//
//  NewsOperation.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 27/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class NewsOperation: Operation

{
    var success: (NSArray)->Void
    var failure: (Int) -> Void
    var internetTask: URLSessionDataTask?
    
    init(success: @escaping (NSArray)-> Void, failure: @escaping (Int)-> Void)
        
    {
        self.success = success
        self.failure = failure
    }
    
    override func cancel()
    {
        
        //отмена запроса в интернет
        internetTask?.cancel()
    }
    
    override func main()
    {
        
        // входит один поток
        let semaphore = DispatchSemaphore(value: 0)
        internetTask = API_WRAPPER.getNews(success: {(jsonResponse) in
            // разбираем массивы
            
            // data - разобрать этот блок
            
            let outData = NSMutableArray()
            
            let data = jsonResponse ["response"]
            let itemsArray = data ["items"].arrayValue
           
            
            
            //
            
            for i in 0..<itemsArray.count
                
            {
                if self.isCancelled
                {
                    //выходим из цикла (прекращаем парсинг), если операция отменена
                    break
                }
                
                let item  = itemsArray[i]
                let text = item["text"].stringValue
                let attachments = item ["attachments"].arrayValue
                
                
                if text == "" && attachments.count == 0
                {
                    //прерывает цикл здесь и идет дальше
                    continue
                }
                
                
                // ["photo_604"]
                
                //массив фоток
                var resultPictures = [NewsPicture]()
                for attachment in attachments
                {
                    let pictureURL = attachment["photo"]["photo_604"].stringValue
                    let idPicture = attachment["photo"]["id"].stringValue
                    
                    let datePicture = attachment["photo"]["date"].stringValue
                    resultPictures.append(NewsPicture(id: idPicture, photoURL: pictureURL, date: datePicture))
                }
                
                let news  = News (id:item ["-50765346"].stringValue)
                
                outData.add (news)
                
               
                
             
                
                if text != ""
                {
                    let textModel  = NewsText (text: text)
                    news.contentArray.add(textModel)
                }
                if resultPictures.count != 0
                {
                    let  pictureModel = NewsPictures(picturesArray: resultPictures)
                    news.contentArray.add(pictureModel)
                }
              
                
            }
            
            if self.isCancelled == false
            {
                self.success(outData)
            }
            else
                
            {
                // если отменили, то передается пустой массив)
                self.success(NSArray())
            }
            
            // освободили семафор -значит, могут новые операции выполниться
            
            semaphore.signal()
            
            
        }, failure: { (code) in
            
            // освободили семмфор
            semaphore.signal()
            
            self.failure(code)
            
            
        })
        //если у нас ничего не возвращается, семафор всегда ждет
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
    

}
