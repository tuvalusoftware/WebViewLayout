//
//  ControlViewController.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 12/22/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {

    var layoutDelegate: PopoverDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func item1Action(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        layoutDelegate?.LayoutItemChoosed!(id: 1)
    }
    
    @IBAction func Item2Action(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        layoutDelegate?.LayoutItemChoosed!(id: 2)
    }
    
    @IBAction func Item3Action(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        layoutDelegate?.LayoutItemChoosed!(id: 3)
    }
    

}
