//
//  ViewController.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 11/11/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let html = try! String(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8)
        webView.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

