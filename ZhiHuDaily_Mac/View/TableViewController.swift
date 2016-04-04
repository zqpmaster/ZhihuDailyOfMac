//
//  TableViewController.swift
//  ZhiHuDaily_Mac
//
//  Created by max on 14-9-8.
//  Copyright (c) 2014年 max. All rights reserved.
//

import Cocoa
import Kingfisher

class TableViewController: NSObject,NSTableViewDelegate,NSTableViewDataSource {
    
    @IBOutlet var detailView: DetailView!
    var contentOfTableView=NSArray()
    @IBOutlet weak var tableView: NSTableView!

    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int{
        
        return contentOfTableView.count
    }

    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView?{
        
        let tableCellView=tableView.makeViewWithIdentifier("MainCell", owner: self) as! NSTableCellView
        let storyIn=contentOfTableView.objectAtIndex(row) as! Story
        
        tableCellView.textField?.stringValue=storyIn.title
        tableCellView.imageView?.kf_setImageWithURL(NSURL.init(string: storyIn.image) ?? NSURL.init())
   
        return tableCellView
    }
    func tableViewSelectionDidChange(notification: NSNotification) {
        
        let tableView=notification.object as! NSTableView;
        let row=tableView.selectedRow
        NSBundle.mainBundle().loadNibNamed("DetailView", owner: self, topLevelObjects: nil);//加载detailView
        
        let story:Story=self.contentOfTableView[row] as! Story
        
        self.detailView.indexCom=story.id.integerValue
        self.tableView.window?.contentView!.addSubview(detailView)
        
        NSLog("aaa")
    }

}
