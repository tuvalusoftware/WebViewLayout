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
        
        let htmlPath = Bundle.main.path(forResource: "index2", ofType: "html")!
        
        var  filePath = Bundle.main.resourcePath
        
        let webAppUrl = NSURL(fileURLWithPath: filePath!, isDirectory: true)
        let fileUrl = NSURL(fileURLWithPath: htmlPath, isDirectory: false)
        
        webView.loadFileURL(fileUrl as URL, allowingReadAccessTo: webAppUrl as URL)
        
        
        // Let template format dates with `{{format(...)}}`
     /*   let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        template.register(dateFormatter, forKey: "format")
        
        // The rendered data
        let data: [String: Any] = [
            "name": "Arthur",
            "date": Date(),
            "realDate": Date().addingTimeInterval(60*60*24*3),
            "late": true
        ]*/
        
        // The rendering: "Hello Arthur..."
      //  let rendering = try template.render(data)
   
  
    }
    
    
    
  
    
    func initWebServer(_ basePath: URL) {
       
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
