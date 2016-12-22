//
//  CollectionViewCell.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 12/22/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(id: Int, type: String) {
        if type == "controllers" {
            imgView.isHidden = false
            imgView.image = UIImage(named: "\(id/3 + 1)")
            lbName.isHidden = true
        } else if type == "data" {
            lbName.isHidden = false
            lbName.text = "\(id)"
            imgView.isHidden = true
            
        }
    }

}
