//
//  Story.swift
//  ZhiHuDaily_Mac
//
//  Created by max on 14-9-8.
//  Copyright (c) 2014年 max. All rights reserved.
//

import Cocoa

class Story: NSObject {
    let title:String
    let image:String
    let id:NSNumber
    
    init(title:String,image:String,id:NSNumber) {//designated construct

        self.title=title
        self.image=image
        self.id=id
        
        super.init()
    }
    
    
}
