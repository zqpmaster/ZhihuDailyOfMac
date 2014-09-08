//
//  TableViewController.swift
//  ZhiHuDaily_Mac
//
//  Created by ZQP on 14-9-8.
//  Copyright (c) 2014年 ZQP. All rights reserved.
//

import Cocoa

class TableViewController: NSObject,NSTableViewDelegate,NSTableViewDataSource {
    
    var contentOfTableView=NSArray()
    @IBOutlet weak var tableView: NSTableView!

    
    func numberOfRowsInTableView(tableView: NSTableView!) -> Int{
        
        return contentOfTableView.count
    }

    func tableView(tableView: NSTableView!, viewForTableColumn tableColumn: NSTableColumn!, row: Int) -> NSView!{
        
        let tableCellView=tableView.makeViewWithIdentifier("MainCell", owner: self) as NSTableCellView
        let storyIn=contentOfTableView.objectAtIndex(row) as Story
        
        tableCellView.textField.stringValue=storyIn.title
        tableCellView.imageView.objectValue=NSImage(contentsOfFile: "选图_选中")
        
        return tableCellView
    }


}
