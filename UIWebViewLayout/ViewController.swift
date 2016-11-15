//
//  ViewController.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 11/11/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit
import WebKit
import GCDWebServer

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var uiwebView: UIWebView!
    var webServer:GCDWebServer!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
       // self.webView.navigationDelegate = self
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")!
        
        var  filePath = Bundle.main.resourcePath
        
        let webAppUrl = NSURL(fileURLWithPath: filePath!, isDirectory: true)
        let fileUrl = NSURL(fileURLWithPath: htmlPath, isDirectory: false)
        
        webView.loadFileURL(fileUrl as URL, allowingReadAccessTo: webAppUrl as URL)
        
        
        
        
     
        
        
        
        
        
            //    let webAppUrl = NSURL(fileURLWithPath: htmlPath, isDirectory: true)
            //    webView.loadFileURL(url, allowingReadAccessToURL: webAppUrl)
       
       // let jsPath = Bundle.main.path(forResource: "angular-animate.min", ofType: "js")!
        //
        
        
       // let html = try! String(contentsOfFile: htmlPath, encoding: String.Encoding.utf8)
       // let jsString = try! String(contentsOfFile: jsPath, encoding: String.Encoding.utf8)
        
       
        
        //webView.loadHTMLString(html, baseURL: nil)
        
 
    }
    
    
    func webView(webView: WKWebView!, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError!) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

