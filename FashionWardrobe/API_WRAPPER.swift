//
//  API_WRAPPER.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 27/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation


import Foundation
import SwiftyJSON

class API_WRAPPER
    
{
    
    class func getNews (success: @escaping (JSON)-> Void, failure: @escaping (Int)->Void)-> URLSessionDataTask
    {
        let urlString = "https://api.vk.com/method/wall.get?owner_id=-50765346&extended=1&filter=owner&count=50&v=5.62&access_token=\(VKAuthManager.sharedInstance.getAccessToken()!)"
        let url = URL (string: urlString)!
        let request = URLRequest (url: url)
        
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            
            self.genericCompletionCallback(data: data, response: response, error: error, success: success, failure: failure)
            
        })
        
        task.resume ()
        return task
        
    }
    
    class func loginUser (email: String, password: String, success: @escaping (JSON)-> Void, failure: @escaping (Int)->Void)-> URLSessionDataTask
    
    {
        let urlString = "https://us-central1-fashionwardrobe-b0f47.cloudfunctions.net/authUserWithEmail?email=\(email)&password=\(password)"
        let url = URL (string: urlString)!
        let request = URLRequest (url: url)
        
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            
            self.genericCompletionCallback(data: data, response: response, error: error, success: success, failure: failure)
            
        })
        
        task.resume ()
        return task
        
    }
    
    
    
}
//обработчик ответов из интернета
extension API_WRAPPER
    
{
    class func genericCompletionCallback  (
        data : Data? ,
        response : URLResponse? ,
        error : Error? ,
        success : (JSON) -> Void ,
        failure : (Int) -> Void
        )
    {
        if (error != nil)
        {
            failure ((error as! NSError).code)
            return
        }
        
        if let rawData = data
        {
            //форма do try catch  - если try выполняется, то выполняется все в блоке do, если не выполняется - выполняется блок catch
            do
            {
                let rawJSON = try JSONSerialization.jsonObject(with: rawData, options: JSONSerialization.ReadingOptions.mutableContainers)
                let json = JSON (rawJSON)
                print ("ответ - \(json)")
                //  -  здесь success нас перекидывает в newsFeedManager -  в API_WRAPPER.getPhotos и начинается парсинг
                success(json)
                return
            }
                //если try не выполняется - выполняется catch
            catch
            {
                print ("парсинг не удался")
                failure (-1)
                return
            }
            failure (-1)
        }
    }
}
