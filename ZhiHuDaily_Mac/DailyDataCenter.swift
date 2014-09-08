//
//  DailyDataCenter.swift
//  ZhiHuDaily_Mac
//
//  Created by ZQP on 14-9-7.
//  Copyright (c) 2014年 ZQP. All rights reserved.
//

import Cocoa
//import ALamofire

class DailyDataCenter: NSObject {
    
    class var sharedInstance: DailyDataCenter {
        
    struct Singleton {
        static let instance = DailyDataCenter()
        }
        
        return Singleton.instance
    }
    
}
