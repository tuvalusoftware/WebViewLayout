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
            if id >= 1 && id <= 3 {
                imgView.image = UIImage(named: "2")
            } else if id >= 4 && id <= 6 {
                imgView.image = UIImage(named: "3")
            } else if id >= 7 && id <= 9 {
                imgView.image = UIImage(named: "4")
            } else if id >= 10 && id <= 12 {
                imgView.image = UIImage(named: "5")
            }else if id >= 13 && id <= 15 {
                imgView.image = UIImage(named: "6")
            }else if id >= 16 && id <= 18 {
                imgView.image = UIImage(named: "7")
            }
            lbName.isHidden = true
        } else if type == "data" {
            lbName.isHidden = false
            lbName.text = "\(id)"
            imgView.isHidden = true
            
        }
    }

}
