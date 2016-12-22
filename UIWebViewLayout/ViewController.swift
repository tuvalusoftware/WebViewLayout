 
import UIKit
import WebKit
import ObjectMapper

var myContext = 0
 
 
 


class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    

    weak var webView: ChartWebFrame?
  
    
    
 
    
    
    func addButton(){
        
        
        
        let button = UIButton(frame: CGRect(x: 4, y: 10, width: 100, height: 40))
        button.backgroundColor = .yellow
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    
        @IBAction func buttonAction(_ sender: AnyObject) {
            
            
            
            guard let jsonPath = Bundle.main.path(forResource: "data", ofType: "json") else {
                
                print("error")
             
              
                
                return
            }
            
            do
            {
                
                func callback (_: Any?, _: Error?) ->Void
                {
                    
                    print("completed with")
                }
            
                let temp = "vingo"
               // let jsonString = try NSString(contentsOfFile: jsonPath, encoding: String.Encoding.utf8.rawValue) as String
                
                let jsonString = "{ \"label\": [\"2006\", \"2007\", \"2008\", \"2009\", \"2010\", \"2011\", \"2012\"],\r\n\"series\":[\"Series A\", \"Series B\"],\r\n\"data\":[\r\n    [65, 59, 80, 81, 56, 55, 40],\r\n    [28, 48, 40, 19, 86, 27, 90]\r\n  ]}"
               
                
                let trimmed2  = jsonString.replacingOccurrences(of: "\n", with: "")
                let trimmed3  = trimmed2.replacingOccurrences(of: "\r", with: "")
               
                let source = "setJson('\(trimmed3)')"
                webView?.evaluateJavaScript(source, completionHandler:callback)
             
            }
            catch
            {
                print("exception")
                
            }
            
            
 
            
        }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let JSONString = "{ \"label\": [\"2006\", \"2007\", \"2008\", \"2009\", \"2010\", \"2011\", \"2012\"],\r\n\"series\":[\"Series A\", \"Series B\"],\r\n\"data\":[\r\n    [65, 59, 80, 81, 56, 55, 40],\r\n    [28, 48, 40, 19, 86, 27, 90]\r\n  ]}"
        
        let user = Mapper<ChartMessage>().map(JSONString: JSONString)
        let jsonstr = user?.toJSONString(prettyPrint: true)
        
        
        
        class NotificationScriptMessageHandler: NSObject, WKScriptMessageHandler {
            
            public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
            {
                print(message.body)
                
            }
            
            
            
        }
        
        
        addButton()
        
 
        
        let margin:CGFloat = 80
        
        let rect = CGRect(x: 0, y: margin, width: self.view.frame.width, height:self.view.frame.height-margin)
        
 
        self.view.backgroundColor = UIColor.red
        
        let webView = ChartWebFrame(withoutconfig: rect, template: Templates.rows2column1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            webView.updateDimensions(json: JSONString)
        }
        
        
        
        webView.backgroundColor = UIColor.green
        
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = false
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        let handler = NotificationScriptMessageHandler()
        
        webView.addHandler(handler:handler, channel: "channel1")

        self.view.addSubview(webView)
        self.webView = webView
     
    }
    
  
    
 
    
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
