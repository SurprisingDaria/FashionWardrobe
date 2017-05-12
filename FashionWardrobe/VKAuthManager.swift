//
//  VKAuthManager.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 12/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

import UIKit
import VK_ios_sdk
// весь файл?????
//MARK: - интерфейс
class VKAuthManager : NSObject
{
    static let sharedInstance = VKAuthManager()
    // single tone - объект в единственном экземпляре
    var success : (() -> Void)!
    var failure : (() -> Void)!
    weak var controller : UIViewController?
    
    var sdkInstance : VKSdk!
    
}

// MARK:- внешний интерфейс процедур авторизации
extension VKAuthManager
{
    func authorize (withController controller : UIViewController, success : @escaping () -> Void, failure : @escaping () -> Void)
    {
        if getAccessToken() != nil
        {
            success()
            return
        }
        
        self.success = success
        self.failure = failure
        self.controller = controller
        
        sdkInstance = VKSdk.initialize(withAppId: "5859516")
        sdkInstance.uiDelegate = self
        sdkInstance.register(self)
        
        VKSdk.authorize(["friends" , "photos" , "audio" , "video" , "messages" , "wall" , "offline"])
        
    }
}
//MARK:- обработка URL схемы от приложения VK
extension VKAuthManager
{
    func process ( url : URL, fromApplication app : String?) -> Bool
    {
        return VKSdk.processOpen(url, fromApplication: app)
    }
}

// MARK:- реализация процедур протоколов VKSDKDelegate, VKSDKUIDelegate
extension VKAuthManager : VKSdkDelegate, VKSdkUIDelegate
    
{
    func vkSdkUserAuthorizationFailed()
    {
        failure()
    }
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!)
    {
        if let token = result.token
        {
            setAccessToken(token: token.accessToken)
            print("token - \(token.accessToken)")
            success()
        }
        else
        {
            failure()
        }
    }
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!)
    {
        
    }
    func vkSdkShouldPresent(_ controller: UIViewController!)
    {
        self.controller?.present(controller, animated: true, completion: nil)
    }
    
}

//MARK: - хранение токена
extension VKAuthManager
{
    func setAccessToken (token : String)
    {
        UserDefaults.standard.set(token, forKey: "X-ACCESS-TOKEN")
        UserDefaults.standard.synchronize()
    }
    func getAccessToken ()-> String?
    {
        return UserDefaults.standard.value(forKey: "X-ACCESS-TOKEN") as? String
        
    }
}
