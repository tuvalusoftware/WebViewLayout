 

import UIKit
import GCDWebServer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var application_support:URL?
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        self.webServer = GCDWebServer()
//        // Add a handler to respond to GET requests on any URL
//        webServer?.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self, processBlock: {request in
//            return GCDWebServerDataResponse(html:"<html><body><p>Hello World</p></body></html>")
//        })
//        
//        // Start server on port 8080
//        webServer?.start(withPort: 8080, bonjourName: nil)
//        print("Visit \(webServer?.serverURL) in your web browser")
        
        
       // writeFileToDocument()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func writeFileToDocument() {
        let applicationUrl =  FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
        let path1 = Bundle.main.resourcePath!
        
        let fileManager = FileManager()
        let en=fileManager.enumerator(atPath: path1)
        
        if !fileManager.fileExists(atPath: (applicationUrl?.path)!){
            do{
                try fileManager.createDirectory(atPath: (applicationUrl?.path)!, withIntermediateDirectories: true, attributes: nil)
            } catch let error as NSError{
                print(error)
            }
        }
        
        application_support = applicationUrl
        
        while let element = en?.nextObject() as? String {
            print(element)
            
            
            do {
                
                
                var readString = "" // Used to store the file contents
                // Read the file contents
                //readString = try String(contentsOfFile: path1 + "/" + element, encoding: String.Encoding.utf8)
                let srcURL = URL(string: "file://" + path1 + "/" + element)
                
                let nameOfFile = element.characters.split{$0 == "/"}.map(String.init)
                
                if let desURL = applicationUrl?.appendingPathComponent(nameOfFile[nameOfFile.count - 1]) {
                    do {
                        try fileManager.copyItem(at: srcURL!, to: desURL)
                        //try readString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                    }
                    catch let errors as NSError { print(errors)}
                }
                
                
            } catch let error as NSError {
                if !element.contains(".") {
                    
                }
                print("Failed reading from URL: \(element), Error: " + error.localizedDescription)
            }
            
            
            if element.hasSuffix("js") {
                // do something with the_path/*.ext ....
            }
        }
        print(applicationUrl)
    }



}

