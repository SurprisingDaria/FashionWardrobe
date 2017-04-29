//
//  ProfileManager.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 28/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation
// здесь будет инфа для логина и инфа по профайлу
class ProfileManager

{
    class func getLoginData (success: @escaping(ProfileHeader) -> Void, failure: @escaping (Int) ->Void, email: String, password: String)
    {
        
        
        let loginOp = LoginOperation(success: { (profile) in
            
            success(profile)
            
            
        }, failure: {errorCode in
            
            failure(errorCode)
            
            
        }, email: email, password: password)
        
        
        
        OperationsManager.addOperation(op: loginOp, cancellingQueue: true)
    }
}
