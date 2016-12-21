//
//  ChartWebFrame.swift
//  UIWebViewLayout
//
//  Created by TimO'Brien on 12/20/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit
import WebKit

enum Templates:String {
    
    case  rows2column1 = "index2"
    case  multipart    = "index3"
    
    
    
}

class ChartWebFrame: WKWebView {
    
    
    var application_support:URL?
    
    
    init(withoutconfig frame: CGRect,
         template:String, jsonData:String)
    {
     
        super.init(frame: frame,configuration: WKWebViewConfiguration())

        configuration.userContentController = WKUserContentController()
        
        setApplicationSupport()
        do{
            try  preLoadInjectJavascript()
        }
        catch
        {
            
            
        }
        
        loadTemplateFromResourceDir(template: template)
        
    }
    
    init(frame: CGRect,
                  configuration: WKWebViewConfiguration, template:String, jsonData:String)
    {
        
        super.init(frame: frame,configuration: configuration)
        
        
        configuration.userContentController = WKUserContentController()
        
         setApplicationSupport()
        do{
           try  preLoadInjectJavascript()
        }
        catch
        {
            
            
        }

       loadTemplateFromResourceDir(template: template)
       
   }





    required init?(coder: NSCoder)
    {
          super.init(coder: coder)
       
    }
    
    
    
   
    
    
    func updateTemplate(templateName:String)
    {

        let htmlPath = Bundle.main.path(forResource:templateName, ofType: "html")!
        let  filePath = Bundle.main.resourcePath
        let webAppUrl = NSURL(fileURLWithPath: filePath!, isDirectory: true)
        let fileUrl = NSURL(fileURLWithPath: htmlPath, isDirectory: false)
        self.loadFileURL(fileUrl as URL, allowingReadAccessTo: webAppUrl as URL)
        
    }
    
    
    
    func updateDimensions(json:String)
    {
        
        let jsonTrimmed  = json.replacingOccurrences(of: "\n", with: "")
        
        
        func callback (_: Any?, _: Error?) ->Void
        {
            
            print("completed with")
        }
        
        let source = "setJson('\(jsonTrimmed)')"
        self.evaluateJavaScript(source, completionHandler:callback)
        
        
    }
    
    // add a handler.
    func addHandler(handler:WKScriptMessageHandler,channel:String)
    {
        self.configuration.userContentController.add(handler, name: channel)
    }
  
    
    /*
         load the template from the resources directory
 
   */
     func loadTemplateFromResource(template:String)
    {
        
        let htmlPath = Bundle.main.path(forResource:template, ofType: "html")!
        let  filePath = Bundle.main.resourcePath
        let webAppUrl = NSURL(fileURLWithPath: filePath!, isDirectory: true)
        let fileUrl = NSURL(fileURLWithPath: htmlPath, isDirectory: false)
        self.loadFileURL(fileUrl as URL, allowingReadAccessTo: webAppUrl as URL)
    }
    
    /*
     load the template from the resources directory
     
     */
    func loadTemplateFromResourceDir(template:String)
    {
        
        let htmlPath = Bundle.main.path(forResource:template, ofType: "html")!
        let  filePath = Bundle.main.resourcePath
        let webAppUrl = NSURL(fileURLWithPath: filePath!, isDirectory: true)
        let fileUrl = NSURL(fileURLWithPath: htmlPath, isDirectory: false)
        self.loadFileURL(fileUrl as URL, allowingReadAccessTo: webAppUrl as URL)
    }
    
    
    /*
     load the template from the readable/writable directory
     
     */
    func loadTemplateFromSupport(template:String)
    {
        
        var support = application_support
        
        
        support?.appendPathComponent(template, isDirectory: false)
        
        
        
       self.loadFileURL(NSURL(fileURLWithPath:(support?.path)!, isDirectory: false) as URL, allowingReadAccessTo: NSURL(fileURLWithPath:(application_support?.path)! , isDirectory: true) as URL)
        
    }
    
    
    func loadTemplateString(template:String)
    {
        
        let webAppUrl = NSURL(fileURLWithPath: Bundle.main.resourcePath! , isDirectory: true)
        self.loadHTMLString(template, baseURL:webAppUrl as URL)
        
        
    }
    
    
    
    private func flushCache()
    {
        let websiteDataTypes = NSSet(array: [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache])
        let date = NSDate(timeIntervalSince1970: 0)
        WKWebsiteDataStore.default().removeData(ofTypes: websiteDataTypes as! Set<String>, modifiedSince: date as Date, completionHandler:{ })
        
        
    }
    
    private func setApplicationSupport()
    {
        
        self.application_support =  FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first

    }
    
    
    
    
    
    
    private  func sendJavascriptMessage(javascript:String)
    {
        
        func callback (_: Any?, _: Error?) ->Void
        {
            
            print("completed")
        }
        
        let trimmed3  = javascript.replacingOccurrences(of: "\n", with: "")
        self.evaluateJavaScript(trimmed3, completionHandler:callback)
    }
    
    
    /*
     inject javascript definitions into
     
     
     */
    private func preLoadInjectJavascript() throws  {
        
        
        guard let scriptPath = Bundle.main.path(forResource: "Javascript", ofType: "js") else {
            print("error")
            return
        }
        
        guard let variablesPath = Bundle.main.path(forResource: "variables", ofType: "js") else {
            
            print("error")
            return
        }
        
        
        let scriptString2 = try NSString(contentsOfFile: variablesPath, encoding: String.Encoding.utf8.rawValue) as String
        let script2 = WKUserScript(source: scriptString2, injectionTime: .atDocumentStart, forMainFrameOnly: true)
        self.configuration.userContentController.addUserScript(script2)
        
        let scriptString = try NSString(contentsOfFile: scriptPath, encoding: String.Encoding.utf8.rawValue) as String
        let script = WKUserScript(source: scriptString, injectionTime: .atDocumentStart, forMainFrameOnly: true)
        
        self.configuration.userContentController.addUserScript(script)
    }

}
