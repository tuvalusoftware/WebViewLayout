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
        self.webView.navigationDelegate = self
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")!
        
        let html = try! String(contentsOfFile: htmlPath, encoding: String.Encoding.utf8)
        webView.loadHTMLString(html, baseURL: nil)
        
        //        var bundleURL = Bundle.main.bundleURL
        //        var basePath: URL? = nil
        //        // Init WebServer
        //        self.initWebServer(URL(string: "app", relativeTo: bundleURL)!.absoluteURL)
        //        basePath = URL(string: "http://localhost:8080/page.html#/home", relativeTo: nil)!
        //        var request = URLRequest(url: basePath!)
        //        self.webView.load(request)
    }
    
    
    //    func configWeb() -> WKWebViewConfiguration {
    //        let configuration = WKWebViewConfiguration()
    //        configuration.preferences = WKPreferences()
    //        configuration.preferences.minimumFontSize = 18
    //        configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
    //        configuration.userContentController = WKUserContentController()
    //        configuration.userContentController.add(self as! WKScriptMessageHandler, name: "readJsonFile")
    //
    //        return configuration
    //    }
    
    func initWebServer(_ basePath: URL) {
        // Create server
        //        self.webServer = GCDWebServer()
        //        let GCDWebServer_DEBUG = 0
        //        let GCDWebServer_VERBOSE = 1
        //        let GCDWebServer_INFO = 2
        //        let GCDWebServer_WARNING = 3
        //        let GCDWebServer_ERROR = 4
        //        let GCDWebServer_EXCEPTION = 5
        //        GCDWebServer.setLogLevel(Int32(GCDWebServer_ERROR))
        // Add a handler to respond to GET requests on any URL
        //        webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self) { (request) -> GCDWebServerResponse? in
        //            var page = request.url!.lastPathComponent!
        //            var path = request.url!.path!
        //            var file = path
        //            var fullPath = "\(basePath)\(path)"
        //            var sFullPath = fullPath.substring(from: fullPath.index(fullPath.startIndex, offsetBy: 7))
        //            var isText = false
        //            if page.lastPathComponent.hasSuffix("html") {
        //                isText = true
        //            }
        //            do {
        //                if isText {
        //                    var error: Error? = nil
        //                    var html = try String(contentsOfFile: sFullPath, encoding: String.Encoding.utf8)
        //                    return GCDWebServerDataResponse(html: html)
        //                }
        //                else {
        //                    var data = Data(contentsOfFile: sFullPath)
        //                    if data != nil {
        //                        var type = "image/jpeg"
        //                        if page.lastPathComponent.hasSuffix("jpg") {
        //                            type = "image/jpeg"
        //                        }
        //                        else if page.lastPathComponent.hasSuffix("png") {
        //                            type = "image/png"
        //                        }
        //                        else if page.lastPathComponent.hasSuffix("css") {
        //                            type = "text/css"
        //                        }
        //                        else if page.lastPathComponent.hasSuffix("js") {
        //                            type = "text/javascript"
        //                        }
        //
        //                        return GCDWebServerDataResponse(data, contentType: type)
        //                    }
        //                    else {
        //                        return GCDWebServerDataResponse(html: "<html><body><p>404 : unknown file \(sFullPath) World</p></body></html>")
        //                    }
        //                }
        //            }
        //            webServer.start(withPort: 8080, bonjourName: nil)
        //        }
        //        webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self) { (request) -> GCDWebServerResponse? in
        //            var path = request?.url!.path
        //            var file = path
        //            var fullPath = "\(basePath)\(path)"
        //            var sFullPath = fullPath.substring(from: fullPath.index(fullPath.startIndex, offsetBy: 7))
        //            return GCDWebServerDataResponse(html: "<html><body><p>404 : unknown file \(sFullPath) World</p></body></html>")
        //        }
    }
    //        webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self, processBlock: {request in
    //            var page = request.url!.lastPathComponent!
    //            var path = request.url!.path!
    //            var file = path
    //            var fullPath = "\(basePath)\(path)"
    //            var sFullPath = fullPath.substring(from: fullPath.index(fullPath.startIndex, offsetBy: 7))
    //            var isText = false
    //            if page.lastPathComponent.hasSuffix("html") {
    //                isText = true
    //            }
    //            do {
    //                if isText {
    //                    var error: Error? = nil
    //                    var html = try String(contentsOfFile: sFullPath, encoding: String.Encoding.utf8)
    //                    return GCDWebServerDataResponse(html: html)
    //                }
    //                else {
    //                    var data = Data(contentsOfFile: sFullPath)
    //                    if data != nil {
    //                        var type = "image/jpeg"
    //                        if page.lastPathComponent.hasSuffix("jpg") {
    //                            type = "image/jpeg"
    //                        }
    //                        else if page.lastPathComponent.hasSuffix("png") {
    //                            type = "image/png"
    //                        }
    //                        else if page.lastPathComponent.hasSuffix("css") {
    //                            type = "text/css"
    //                        }
    //                        else if page.lastPathComponent.hasSuffix("js") {
    //                            type = "text/javascript"
    //                        }
    //
    //                        return GCDWebServerDataResponse(data, contentType: type)
    //                    }
    //                    else {
    //                        return GCDWebServerDataResponse(html: "<html><body><p>404 : unknown file \(sFullPath) World</p></body></html>")
    //                    }
    //                }
    //            }
    //        })
    //        webServer.start(withPort: 8080, bonjourName: nil)
    //    }
    
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
