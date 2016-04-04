//
//  AppDelegate.swift
//  ZhiHuDaily_Mac
//
//  Created by max on 14-9-7.
//  Copyright (c) 2014年 max. All rights reserved.
//

import Cocoa
import Alamofire

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var tableViewController: TableViewController!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        loadData()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        self.window.makeKeyAndOrderFront(self)
        return true
    }

//    var storyArray:NSMutableArray?
    
    func loadData(){
        let arrayOfData=NSMutableArray()
        let managerAf=Manager.sharedInstance
        let url=NSURL(string: "http://news-at.zhihu.com/api/3/news/latest")
        let urlRequest=NSURLRequest(URL: url!)
        let request=managerAf.request(urlRequest)
        request.responseJSON { (response) in
            if nil == response.result.value
            {
                return;
            }
            
            let resDic=response.result.value as! NSDictionary
            let array=resDic["stories"] as! NSArray
            for dic in array{
                
                let title=dic["title"] as! String
                let imageArr=dic["images"] as! NSArray
                let image=imageArr[0] as! String
                
                let number=dic["id"] as! NSNumber
                let story=Story(title: title, image: image, id: number)
                arrayOfData.addObject(story)
                
            }
            let imuArray=NSArray(array:arrayOfData)
            self.tableViewController.contentOfTableView=imuArray
            self.tableViewController.tableView.reloadData()
        }

    }

}

