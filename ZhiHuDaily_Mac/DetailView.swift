//
//  DetailView.swift
//  ZhiHuDaily_Mac
//
//  Created by max on 14-9-17.
//  Copyright (c) 2014年 max. All rights reserved.
//

import Cocoa
import WebKit
import Alamofire

class DetailView: NSView {

    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var activitor: NSProgressIndicator!
    @IBOutlet weak var imageVIew: NSImageView!
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.activitor.alphaValue=1;
        self.activitor.startAnimation(nil);
    }
    
    var indexCom:Int{
        get{return 0}
        set{
            _=newValue as Int
//            var operation=NSInvocationOperation(target: self,selector: Selector("loadHtmlWithIndex:"),object: value)
//            NSOperationQueue().addOperation(operation)
            loadHtmlWithIndex(newValue)
            
        }
    }
    func loadHtmlWithIndex(ind:Int){
        let managerAf=Manager.sharedInstance
        let urlStr="http://news-at.zhihu.com/api/3/news/"+String(ind)
        let url=NSURL(string:urlStr)
        let urlRequest=NSURLRequest(URL: url!)
        let request=managerAf.request(urlRequest)
        request.responseJSON { (response) in
            if nil == response.result.value
            {
                return;
            }
            
            let dic=response.result.value as! NSDictionary
            let body=dic["body"] as! String
            let cssUrl=(dic["css"] as! NSArray).objectAtIndex(0) as! String
            let htmlStr="<link href='"+cssUrl+"' rel='stylesheet' type='text/css' />"+body
            
            let blockOpe=NSBlockOperation(block: { () -> Void in
                self.webView.mainFrame.loadHTMLString(htmlStr, baseURL: nil)
                
                self.activitor.stopAnimation(nil);
                self.activitor.alphaValue=0.0
            })
            NSOperationQueue.mainQueue().addOperation(blockOpe)
        }

    }
    
    @IBAction func backBtnAction(sender: AnyObject) {
        self.removeFromSuperview()
    }
}
