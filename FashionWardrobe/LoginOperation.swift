//
//  LoginOperation.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 28/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class LoginOperation: Operation

{
    var success: (ProfileHeader)-> Void
    var failure: (Int) -> Void
    var internetTask: URLSessionDataTask?
    var email: String
    var password: String
    
    init(success: @escaping (ProfileHeader)-> Void, failure: @escaping (Int)-> Void, email: String, password: String)
        
    {
        self.success = success
        self.failure = failure
        self.email = email
        self.password = password
    }
    
    override func cancel()
    {
        
        //отмена запроса в интернет, вызываем в критических точках - если операция отменена, отменяем запрос в инет
        internetTask?.cancel()
    }
    
    override func main()
    {
        
        // входит один поток
        let semaphore = DispatchSemaphore(value: 0)
        internetTask = API_WRAPPER.loginUser(email: email, password: password, success: { (json) in
            
         
            let data = json["response"]
            if let successRequest = data["success"].bool
            {
                if successRequest == true
                {
                    let user = data["user"]
                    let userName = user["displayName"].stringValue
                    let email = user["email"].stringValue
                    let token = user["stsTokenManager"]["accessToken"].stringValue
                    let userID = user["uid"].stringValue
                    
                    let profile  = ProfileHeader(city: "", token: token, email: email, authorID: userID, avatarURL: "", name: userName)
                    
                    self.success(profile)
                }
                
                else
                {
                    self.failure(0)
                }
            }
            else
            {
                self.failure(0)
            }
        
            // закончился парсинг, можно пускать новый поток
            semaphore.signal()
        
        }, failure: { (errorCode) in
            
            // освободили семмфор
            semaphore.signal()
            
            self.failure(errorCode)
        })
        
        //если у нас ничего не возвращается, семафор всегда ждет
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        
    }
    
    
}

