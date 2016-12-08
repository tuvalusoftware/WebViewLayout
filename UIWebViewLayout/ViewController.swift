 
import UIKit
import WebKit
import GCDWebServer
import FileKit


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
        
        
//        let app_resources = Path.allLibraries
//        var user_home = Path.userHome
//        let  application_support = Path.userApplicationSupport
       let  user_documents      = Path.userDocuments
//        
        
        
        let textFiles = Path.userDocuments.find(searchDepth: 5) {
            
             path in
             path.pathExtension == "mustache"
        }
        
        print(textFiles)
      
      
        
        webView = WKWebView (frame: self.view.frame, configuration: webConfig)
        view.addSubview(webView)
        webView!.navigationDelegate = self
 
        let htmlPath = Bundle.main.path(forResource: "myindex", ofType: "html")!
       
        
        print(" \(htmlPath)")
        
        
        
        
        let  filePath = Bundle.main.resourcePath
        
        let mustachePath = filePath?.appending("/index2.mustache")
        
        let templatePath:URL =  URL(fileURLWithPath: mustachePath!, isDirectory: false)
        
        
        do {
            
                let text2 = try String(contentsOf:templatePath, encoding: String.Encoding.utf8)
                print(text2)
        }
        catch {/* error handling here */}
    
        
  
        
        
        
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
        
        let js2:String = String(format: "var appElement = document.querySelector('[ng-app=plunker]'); var appScope = angular.element(appElement).scope(); var controllerScope = appScope.$$childHead; controllerScope.$apply(function() { controllerScope.myValue = 100; });")
        
        print(js2)
        webView?.evaluateJavaScript(js2, completionHandler: { (AnyObject, NSError) -> Void in
            NSLog("%s", #function)
            
        })
        
    }
    
    func writeFileToDocument() {
        var applicationUrl =  try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let path1 = Bundle.main.resourcePath! + "/bower_components"
        
        let fileManager = FileManager()     // let fileManager = NSFileManager.defaultManager()
        let en=fileManager.enumerator(atPath: path1)   // let enumerator:NSDirectoryEnumerator = fileManager.enumeratorAtPath(folderPath)
        
        while let element = en?.nextObject() as? String {
            print(element)
            
            var readString = "" // Used to store the file contents
            do {
                // Read the file contents
                readString = try String(contentsOfFile: path1 + "/" + element, encoding: String.Encoding.utf8)
                
                let nameOfFile = element.characters.split{$0 == "/"}.map(String.init)
                
                if let fileURL = applicationUrl?.appendingPathComponent(nameOfFile[nameOfFile.count - 1]) {
                    do {
                        try readString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                    }
                    catch {/* error handling here */}
                }
                
                
            } catch let error as NSError {
                //print("Failed reading from URL: \(element), Error: " + error.localizedDescription)
            }
            
            
            if element.hasSuffix("js") {
                // do something with the_path/*.ext ....
            }
        }
        print(applicationUrl)
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
