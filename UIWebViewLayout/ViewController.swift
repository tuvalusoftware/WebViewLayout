 
import UIKit
import WebKit
import ObjectMapper

var myContext = 0
let screenSize: CGRect = UIScreen.main.bounds
 
 protocol NotificationDelegate {
    func callLayoutPopover()
    func callControllPopover()
    func callDataPopover()
 }


class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    

    weak var webView: ChartWebFrame?
  
    var  listOfRadarMessages :[ChartMessage] = []
    var  listOfBarMessages   :[ChartMessage] = []
    var  listOfHorizontalBarMessages   :[ChartMessage] = []
    var  listOfDoughnutMessages   :[ChartMessage] = []
    var  listOfPieMessages   :[ChartMessage] = []
    var  listOfPolarMessages   :[ChartMessage] = []
    
   
    
    func createMessages()
    {
        var message =  ChartMessage()
        message.label = ["A", "B", "C", "D", "E", "F", "G"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "radar-id"
        
        listOfRadarMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Dog", "Cat", "Horse", "Lion", "Toad", "Bird", "Mouse"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "radar-id"
        
        listOfRadarMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Hammer", "Drill", "Axe", "Wrench", "Pliars", "Saw", "Drill"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "radar-id"
        
        listOfRadarMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["A", "B", "C", "D", "E", "F", "G"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "bar-id"
        
        listOfBarMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Dog", "Cat", "Horse", "Lion", "Toad", "Bird", "Mouse"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "bar-id"
        
        listOfBarMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Hammer", "Drill", "Axe", "Wrench", "Pliars", "Saw", "Drill"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "bar-id"
        
        listOfBarMessages.append(message)
        
        
        
        message =  ChartMessage()
        message.label = ["A", "B", "C", "D", "E", "F", "G"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "bar-id"
        
        listOfDoughnutMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Dog", "Cat", "Horse", "Lion", "Toad", "Bird", "Mouse"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "bar-id"
        
        listOfDoughnutMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Hammer", "Drill", "Axe", "Wrench", "Pliars", "Saw", "Drill"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "bar-id"
        
        listOfDoughnutMessages.append(message)
        
        message =  ChartMessage()
        message.label = ["A", "B", "C", "D", "E", "F", "G"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "horizontal-bar-id"
        
        listOfHorizontalBarMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Dog", "Cat", "Horse", "Lion", "Toad", "Bird", "Mouse"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "horizontal-bar-id"
        
        listOfHorizontalBarMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Hammer", "Drill", "Axe", "Wrench", "Pliars", "Saw", "Drill"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "horizontal-bar-id"
        
        listOfHorizontalBarMessages.append(message)
        
        message =  ChartMessage()
        message.label = ["A", "B", "C", "D", "E", "F", "G"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "pie-id"
        
        listOfPieMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Dog", "Cat", "Horse", "Lion", "Toad", "Bird", "Mouse"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "pie-id"
        
        listOfPieMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Hammer", "Drill", "Axe", "Wrench", "Pliars", "Saw", "Drill"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "polar-id"
        
        listOfPieMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["A", "B", "C", "D", "E", "F", "G"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "polar-id"
        
        listOfPieMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Dog", "Cat", "Horse", "Lion", "Toad", "Bird", "Mouse"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "polar-id"
        listOfPieMessages.append(message)
        
        
        message =  ChartMessage()
        message.label = ["Hammer", "Drill", "Axe", "Wrench", "Pliars", "Saw", "Drill"]
        message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
        message.element_key = "polar-id"
        
        listOfPieMessages.append(message)
        
        
     
        
    }
    
 
    
    
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
            
                
             
                
   
               let message =  ChartMessage()
                
                message.label = ["A", "B", "C", "D", "E", "F", "G"]
                message.data  = [     [4, 7, 4, 23, 6, 7, 87],[28, 48, 40, 19, 86, 27, 90] ]
                message.series = ["Series A", "Series B"]
                message.element_key = "bar-id"
                
                
                webView?.sendMessage(message: message)
                
                
                
                
             
             
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
            
            var notificationDelegate: NotificationDelegate?
            
            public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
            {
                if let strBody = message.body as? String{
                    if strBody == "layouts" {
                        notificationDelegate?.callLayoutPopover()
                    } else if strBody == "controls" {
                        notificationDelegate?.callControllPopover()
                    } else if strBody == "data" {
                        notificationDelegate?.callDataPopover()
                    }
                }
                
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
        handler.notificationDelegate = self
        
        webView.addHandler(handler:handler, channel: "channel1")

        self.view.addSubview(webView)
        self.webView = webView
     
    }
    
    func AddController() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ControllerViewController") as! ControllerViewController
        vc.layoutDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.preferredContentSize = CGSize(width: screenSize.width - 400, height: screenSize.height/2)
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover.sourceView = self.view
        popover.sourceRect = CGRect(x: (self.view.bounds.midX), y: (self.view.bounds.midY), width: 0, height: 0)
        popover.delegate = self
        present(vc, animated: true, completion:nil)
    }
    
    func AddLayout() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LayoutViewController") as! LayoutViewController
        vc.layoutDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.preferredContentSize = CGSize(width: screenSize.width - 400, height: 80 + 24 + 16)
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover.sourceView = self.view
        popover.sourceRect = CGRect(x: (self.view.bounds.midX), y: (self.view.bounds.midY), width: 0, height: 0)
        popover.delegate = self
        present(vc, animated: true, completion:nil)
    }
    
    func AddData() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        vc.layoutDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.preferredContentSize = CGSize(width: screenSize.width - 400, height: screenSize.height/2)
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover.sourceView = self.view
        popover.sourceRect = CGRect(x: (self.view.bounds.midX), y: (self.view.bounds.midY), width: 0, height: 0)
        popover.delegate = self
        present(vc, animated: true, completion:nil)
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
 
 extension ViewController: NotificationDelegate {
    func callLayoutPopover() {
        AddLayout()
    }
    
    func callControllPopover() {
        AddController()
    }
    func callDataPopover() {
        AddData()
    }
 }
 
 extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverTo rect: UnsafeMutablePointer<CGRect>, in view: AutoreleasingUnsafeMutablePointer<UIView>) {
        let newRect = CGRect(x: (self.view.bounds.midX), y: (self.view.bounds.midY), width: 0, height: 0)
        rect.initialize(to: newRect)
        if popoverPresentationController.presentedViewController.view.tag != 0 {
            
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
//        if whatChoosed == WhatChoosed.addJob {
//            return UIModalPresentationStyle.none
//        } else {
//            return UIModalPresentationStyle.overFullScreen
//        }
    }
    
//    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
//        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
//        
//        let image = UIImage(named: "iconBack")?.resizeImage(targetSize: CGSize(width: 30, height: 30))
//        
//        let btnBack = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
//        btnBack.setImage(image, for: .normal)
//        btnBack.setTitle("   CANCEL", for: .normal)
//        btnBack.addTarget(self, action: #selector(DetailViewController.dismiss as (DetailViewController) -> () -> ()), for: .touchUpInside)
//        
//        let item = UIBarButtonItem()
//        item.customView = btnBack
//        
//        navigationController.topViewController!.navigationItem.leftBarButtonItem = item
//        return navigationController
//    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func dismiss() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
 }

 extension ViewController: PopoverDelegate {
    func DataItemChoosed(id: Int) {
        print("data")
    }
    func ControllerItemChoosed(id: Int) {
         print("controller")
    }
    func LayoutItemChoosed(id: Int) {
         print("layout")
    }
 }
