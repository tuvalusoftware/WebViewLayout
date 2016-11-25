 
import UIKit
import WebKit
import GCDWebServer



class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var uiwebView: UIWebView!
    var webServer:GCDWebServer!
    var webView: WKWebView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
         let template = try! Template(named: "Document")
         _ = try! template.render()
        
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        
 
        let htmlPath = Bundle.main.path(forResource: "index3", ofType: "html")!
        
        
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
