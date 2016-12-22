//
//  CollectionViewCell.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 12/22/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(id: Int, type: String) {
        if type == "controllers" {
            imgView.image = UIImage(named: "\(id%10)")
        } else if type == "data" {
            imgView.image = UIImage(named: "2")
        }
    }

}
