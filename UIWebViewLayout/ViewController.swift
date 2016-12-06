 
import UIKit
import WebKit
import GCDWebServer



class ViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
    
    @IBOutlet weak var uiwebView: UIWebView!
    var webServer:GCDWebServer!
    var webView: WKWebView!

    var webConfig:WKWebViewConfiguration {
        get {
            
            // Create WKWebViewConfiguration instance
            let webCfg:WKWebViewConfiguration = WKWebViewConfiguration()
            
            // Setup WKUserContentController instance for injecting user script
            let userController:WKUserContentController = WKUserContentController()
            
            // Add a script message handler for receiving  "buttonClicked" event notifications posted from the JS document using window.webkit.messageHandlers.buttonClicked.postMessage script message
            userController.add(self as! WKScriptMessageHandler, name: "buttonClicked")
            
            // Get script that's to be injected into the document
            let js:String = buttonClickEventTriggeredScriptToAddToDocument()
            
            // Specify when and where and what user script needs to be injected into the web document
            let userScript:WKUserScript =  WKUserScript(source: js, injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: true)
            
            // Add the user script to the WKUserContentController instance
            userController.addUserScript(userScript)
            
            // Configure the WKWebViewConfiguration instance with the WKUserContentController
            webCfg.userContentController = userController;
            
            return webCfg;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let template = try! Template(named: "Document")
         _ = try! template.render()
        
        webView = WKWebView (frame: self.view.frame, configuration: webConfig)
        view.addSubview(webView)
        webView!.navigationDelegate = self
 
        let htmlPath = Bundle.main.path(forResource: "index2", ofType: "html")!
        
        
        print(" \(htmlPath)")
        
        
        
        
        let  filePath = Bundle.main.resourcePath
        
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
    
    // WKScriptMessageHandler Delegate
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let js2:String = String(format: "var app = angular.module(\'my_app\',[\'chart.js\']); app.controller(\"LineCtrl\", function ($scope) { $scope.labels = [\"tao\", \"day\", \"March\", \"April\", \"May\", \"June\", \"July\"]; $scope.series = [\'Series A\', \'Series B\']; $scope.data = [[\(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100)))], [\(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100))), \(Int(arc4random_uniform(100)))]]; $scope.$apply(); });")
        
        print(js2)
        webView?.evaluateJavaScript(js2, completionHandler: { (AnyObject, NSError) -> Void in
            NSLog("%s", #function)
            
        })
        
    }
    
  
    
    func initWebServer(_ basePath: URL) {
       
    }
    
    func buttonClickEventTriggeredScriptToAddToDocument() ->String{
        // Script: When window is loaded, execute an anonymous function that adds a "click" event handler function to the "ClickMeButton" button element. The "click" event handler calls back into our native code via the window.webkit.messageHandlers.buttonClicked.postMessage call
        var script:String?
        
        if let filePath:String = Bundle(for: ViewController.self).path(forResource: "main_ctrl", ofType:"js") {
            
            script = try? String (contentsOfFile: filePath, encoding: String.Encoding.utf8)
        }
        return script!;
        
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
