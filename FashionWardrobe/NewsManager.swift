//
//  NewsManager.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 27/04/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import Foundation

class NewsManager

{
    static var dataSource = NSMutableArray()
    
    class func numberOfSections ()-> Int
    {
        return dataSource.count
    }
    
    class func numberOfRowsInSection(section: Int) ->Int
    {
        let newsObject = dataSource[section] as! News
        
        return newsObject.contentArray.count
    }
    
    class func object(indexPath: IndexPath)-> Any
    
    {
        let newsObject = dataSource[indexPath.section] as! News
        let contentObject = newsObject.contentArray[indexPath.row]
        
        return contentObject
    }
    
    class func getNews (success: @escaping(NSMutableArray)->Void, failure: @escaping (Int) ->Void)
    
    {
        let newsOp = NewsOperation(success: {(outData) in
            
        self.dataSource = outData as! NSMutableArray
            success (outData as! NSMutableArray)
        }, failure: {errorCode in
                
                failure(errorCode)
        })
        
        OperationsManager.addOperation(op: newsOp, cancellingQueue: true)
    }
}
