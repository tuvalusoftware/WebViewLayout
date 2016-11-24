

import UIKit
import WebKit

class CustomWebView:WKWebView {
    
   //  public init(frame: CGRect, configuration: WKWebViewConfiguration)
    
  
     override init(frame: CGRect, configuration: WKWebViewConfiguration)
     {
        
         let config = WKWebViewConfiguration()
         super.init(frame:frame, configuration:config)
        
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder:coder)
    }
    
   
 
   
    
    func webView(webView: WKWebView!, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError!) {
      
    }
 
    

}
