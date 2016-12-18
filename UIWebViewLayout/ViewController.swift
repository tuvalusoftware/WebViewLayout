//
//  WebViewController.swift
//  WebKitDemo
//
//  Created by Kyusaku Mihara on 9/17/14.
//  Copyright (c) 2014 epohsoft. All rights reserved.
//

import UIKit
import WebKit

var myContext = 0

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    

    weak var webView: WKWebView?
    weak var progressView: WebViewProgressView?
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    @IBOutlet weak var forwardBarButton: UIBarButtonItem!
    @IBOutlet weak var stopBarButton: UIBarButtonItem!
    @IBOutlet weak var refreshBarButton: UIBarButtonItem!
    
    deinit {
        self.webView?.removeObserver(self, forKeyPath: "loading")
        self.webView?.removeObserver(self, forKeyPath: "title")
        self.webView?.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView?.removeObserver(self, forKeyPath: "canGoBack")
        self.webView?.removeObserver(self, forKeyPath: "canGoForward")
    }
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let websiteDataTypes = NSSet(array: [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache])
        let date = NSDate(timeIntervalSince1970: 0)
        WKWebsiteDataStore.default().removeData(ofTypes: websiteDataTypes as! Set<String>, modifiedSince: date as Date, completionHandler:{ })
        
 
//        
//        let source = "document.body.style.background = \"#777\";"
//        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
//        
//        let userContentController = WKUserContentController()
//        userContentController.addUserScript(userScript)
//        
//        let configuration = WKWebViewConfiguration()
//        configuration.userContentController = userContentController
//       // self.webView = WKWebView(frame: self.view.bounds, configuration: configuration)
//        
        
        let dictionaryData = ["hello":"bye" as AnyObject]
        
      //  let allInfoJSON = try NSJSONSerialization.dataWithJSONObject(allInfoRawSwift, options: NSJSONWritingOptions(rawValue: 0))
        
        // Convert swift dictionary into encoded json
        let serializedData = try! JSONSerialization.data(withJSONObject: dictionaryData, options: .prettyPrinted)
        
        
        print("\(serializedData)")
        
        let encodedData = serializedData.base64EncodedData()
        // This WKWebView API to calls 'reloadData' function defined in js
        
        let sample = "hello this is my string"
        let setVar =  "window.testing = \"hello\";"
        
        
        let source = "printOutput('\(sample)')"
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentStart, forMainFrameOnly: true)
        
       let userContentController = WKUserContentController()
//         userContentController.addUserScript(userScript)
        
         let configuration = WKWebViewConfiguration()
        
        
        configuration.userContentController = userContentController
        
        
        
        
        let webView = WKWebView(frame: self.view.bounds, configuration: configuration)
        
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = false
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        
        
//        webView.addObserver(self, forKeyPath: "loading", options: .new, context: &myContext)
//        webView.addObserver(self, forKeyPath: "title", options: .new, context: &myContext)
//        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: &myContext)
//        webView.addObserver(self, forKeyPath: "canGoBack", options: .new, context: &myContext)
//        webView.addObserver(self, forKeyPath: "canGoForward", options: .new, context: &myContext)
        self.view.addSubview(webView)
        self.webView = webView
        
//        let navigationBarBounds = self.navigationController?.navigationBar.bounds
//        let progressView = WebViewProgressView(frame: CGRect(x: 0, y: navigationBarBounds!.size.height - 2, width: navigationBarBounds!.size.width, height: 2))
//        progressView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
//        self.navigationController?.navigationBar.addSubview(progressView)
//        self.progressView = progressView
        
        
       // let htmlPath = Bundle.main.path(forResource: "index2", ofType: "html")!
//        
//        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        var support = appDelegate.application_support
//        
//        support?.appendPathComponent("index2.html", isDirectory: false)
//        
//      
//        
//        webView.loadFileURL(NSURL(fileURLWithPath:(support?.path)!, isDirectory: false) as URL, allowingReadAccessTo: NSURL(fileURLWithPath:(appDelegate.application_support?.path)! , isDirectory: true) as URL)
//        
////   
        
        do{
            
            try  injectAngular(into:webView)
        }
        catch
        {
            print("injection error")
            
        }
        
        
        let htmlPath = Bundle.main.path(forResource: "index2", ofType: "html")!
        let  filePath = Bundle.main.resourcePath
        let webAppUrl = NSURL(fileURLWithPath: filePath!, isDirectory: true)
        let fileUrl = NSURL(fileURLWithPath: htmlPath, isDirectory: false)
        webView.loadFileURL(fileUrl as URL, allowingReadAccessTo: webAppUrl as URL)
        
     
        
    
        
        
        //webView.load(URLRequest(url: URL(string: "https://www.google.co.jp")!))
        
      // evaluateJavaScriptForData(dictionaryData: ["hello":"bye" as AnyObject])
    }
    
    
    func evaluateJavaScriptForData(dictionaryData: [String: AnyObject]) {
        // Convert swift dictionary into encoded json
        let serializedData = try! JSONSerialization.data(withJSONObject: dictionaryData, options: .prettyPrinted)
        
        let encodedData = serializedData.base64EncodedData()
        // This WKWebView API to calls 'reloadData' function defined in js
        
        func callback (_: Any?, _: Error?) ->Void
        {
            
            print("completed with")
        }
        
        webView?.evaluateJavaScript("reloadData('\(encodedData)')", completionHandler:callback)
        
        let source = "reloadData('\(encodedData)')"
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
       // userContentController.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        self.webView = WKWebView(frame: self.view.bounds, configuration: configuration)
        
    
        
        
        
        
        
    }
    
    
    func evaluateJavaScriptForDataInit(dictionaryData: [String: AnyObject]) {
        // Convert swift dictionary into encoded json
        let serializedData = try! JSONSerialization.data(withJSONObject: dictionaryData, options: .prettyPrinted)
        
        let encodedData = serializedData.base64EncodedData()
        // This WKWebView API to calls 'reloadData' function defined in js
        
        
        let source = "reloadData('\(encodedData)')"
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        self.webView = WKWebView(frame: self.view.bounds, configuration: configuration)

   
      

        
       
        
    }
    
    
    func injectAngular(into webView: WKWebView) throws  {
        
        
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
        webView.configuration.userContentController.addUserScript(script2)
        
        let scriptString = try NSString(contentsOfFile: scriptPath, encoding: String.Encoding.utf8.rawValue) as String
        let script = WKUserScript(source: scriptString, injectionTime: .atDocumentStart, forMainFrameOnly: true)
        
        webView.configuration.userContentController.addUserScript(script)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let change = change else { return }
        if context != &myContext {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        if keyPath == "loading" {
            if let loading = (change[NSKeyValueChangeKey.newKey] as AnyObject).boolValue {
                self.stopBarButton?.isEnabled = loading
                self.refreshBarButton?.isEnabled = !loading
            }
            return
        }
        
        if keyPath == "title" {
            if let title = change[NSKeyValueChangeKey.newKey] as? String {
                self.navigationItem.title = title
            }
            return
        }
        
        if keyPath == "estimatedProgress" {
            if let progress = (change[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                self.progressView?.setProgress(progress, animated: true)
            }
            return
        }
        
        if keyPath == "canGoBack" {
            if let canGoBack = (change[NSKeyValueChangeKey.newKey] as AnyObject).boolValue {
                self.backBarButton.isEnabled = canGoBack
            }
            return
        }
        
        if keyPath == "canGoForward" {
            if let canGoForward = (change[NSKeyValueChangeKey.newKey] as AnyObject).boolValue {
                self.forwardBarButton.isEnabled = canGoForward
            }
            return
        }
    }
    
//    @IBAction func backBarButtonTapped(_ sender: AnyObject) {
//        if self.webView!.canGoBack {
//            self.webView!.goBack()
//        }
//    }
//    
//    @IBAction func forwardBarButtonTapped(_ sender: AnyObject) {
//        if self.webView!.canGoForward {
//            self.webView!.goForward()
//        }
//    }
    
//    @IBAction func stopBarButtonTapped(_ sender: AnyObject) {
//        if self.webView!.isLoading {
//            self.webView!.stopLoading()
//        }
//    }
    
//    @IBAction func refreshBarButtonTapped(_ sender: AnyObject) {
//        self.webView?.reload()
//    }
//    
//    // MARK: - WKNavigationDelegate methods
    
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
//        print("webView:\(webView) didStartProvisionalNavigation:\(navigation)")
//    }
//    
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation) {
//        print("webView:\(webView) didCommitNavigation:\(navigation)")
//    }
//    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (@escaping (WKNavigationActionPolicy) -> Void)) {
//        print("webView:\(webView) decidePolicyForNavigationAction:\(navigationAction) decisionHandler:\(decisionHandler)")
//        
//        switch navigationAction.navigationType {
//        case .linkActivated:
//            if navigationAction.targetFrame == nil {
//                self.webView?.load(navigationAction.request)
//            }
//        default:
//            break
//        }
//        
//        decisionHandler(.allow)
//    }
//    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: (@escaping (WKNavigationResponsePolicy) -> Void)) {
//        print("webView:\(webView) decidePolicyForNavigationResponse:\(navigationResponse) decisionHandler:\(decisionHandler)")
//        
//        decisionHandler(.allow)
//    }
//    
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        print("webView:\(webView) didReceiveAuthenticationChallenge:\(challenge) completionHandler:\(completionHandler)")
//        
//        switch (challenge.protectionSpace.authenticationMethod) {
//        case NSURLAuthenticationMethodHTTPBasic:
//            let alertController = UIAlertController(title: "Authentication Required", message: webView.url?.host, preferredStyle: .alert)
//            weak var usernameTextField: UITextField!
//            alertController.addTextField { textField in
//                textField.placeholder = "Username"
//                usernameTextField = textField
//            }
//            weak var passwordTextField: UITextField!
//            alertController.addTextField { textField in
//                textField.placeholder = "Password"
//                textField.isSecureTextEntry = true
//                passwordTextField = textField
//            }
//            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
//                completionHandler(.cancelAuthenticationChallenge, nil)
//            }))
//            alertController.addAction(UIAlertAction(title: "Log In", style: .default, handler: { action in
//                guard let username = usernameTextField.text, let password = passwordTextField.text else {
//                    completionHandler(.rejectProtectionSpace, nil)
//                    return
//                }
//                let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
//                completionHandler(.useCredential, credential)
//            }))
//            self.present(alertController, animated: true, completion: nil)
//        default:
//            completionHandler(.rejectProtectionSpace, nil);
//        }
//    }
//    
//    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation) {
//        print("webView:\(webView) didReceiveServerRedirectForProvisionalNavigation:\(navigation)")
//    }
//    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
//        print("webView:\(webView) didFinishNavigation:\(navigation)")
//    }
//    
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation, withError error: Error) {
//        print("webView:\(webView) didFailNavigation:\(navigation) withError:\(error)")
//    }
//    
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation, withError error: Error) {
//        print("webView:\(webView) didFailProvisionalNavigation:\(navigation) withError:\(error)")
//    }
//    
    // MARK: WKUIDelegate methods
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (@escaping () -> Void)) {
        print("webView:\(webView) runJavaScriptAlertPanelWithMessage:\(message) initiatedByFrame:\(frame) completionHandler:\(completionHandler)")
        
        let alertController = UIAlertController(title: frame.request.url?.host, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completionHandler()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (@escaping (Bool) -> Void)) {
        print("webView:\(webView) runJavaScriptConfirmPanelWithMessage:\(message) initiatedByFrame:\(frame) completionHandler:\(completionHandler)")
        
        let alertController = UIAlertController(title: frame.request.url?.host, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            completionHandler(false)
        }))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completionHandler(true)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        print("webView:\(webView) runJavaScriptTextInputPanelWithPrompt:\(prompt) defaultText:\(defaultText) initiatedByFrame:\(frame) completionHandler:\(completionHandler)")
        
        let alertController = UIAlertController(title: frame.request.url?.host, message: prompt, preferredStyle: .alert)
        weak var alertTextField: UITextField!
        alertController.addTextField { textField in
            textField.text = defaultText
            alertTextField = textField
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            completionHandler(nil)
        }))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completionHandler(alertTextField.text)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
       
}
