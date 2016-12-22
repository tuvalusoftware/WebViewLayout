//
//  LayoutViewController.swift
//  UIWebViewLayout
//
//  Created by Duc Nguyen on 12/22/16.
//  Copyright © 2016 tuvalusoftware. All rights reserved.
//

import UIKit

@objc protocol PopoverDelegate {
    @objc optional func ControllerItemChoosed(id: Int)
    @objc optional func DataItemChoosed(id: Int)
    @objc optional func LayoutItemChoosed(id: Int)
}

class ControllerViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var layoutDelegate: PopoverDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        
        collectionView.collectionViewLayout = CenterAlignedCollectionViewFlowLayout()
        //collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
     
        collectionView?.register(UINib(nibName: "CollectionViewCell", bundle: Bundle(for: type(of: self))), forCellWithReuseIdentifier: "Cell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }

}

extension ControllerViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.setData(id: indexPath.row + 1,type: "controllers")
        return cell
    }
}

extension ControllerViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let flowLayout = (collectionViewLayout as! UICollectionViewFlowLayout)
//        let cellSpacing = flowLayout.minimumInteritemSpacing
//        let cellWidth = flowLayout.itemSize.width
//        let cellCount = CGFloat(collectionView.numberOfItems(inSection: section))
//        
//        let collectionViewWidth = collectionView.bounds.size.width
//        
//        let totalCellWidth = cellCount * cellWidth
//        let totalCellSpacing = cellSpacing * (cellCount - 1)
//        
//        let totalCellsWidth = totalCellWidth + totalCellSpacing
//        
//        let edgeInsets = (collectionViewWidth - totalCellsWidth) / 2.0
//        
//        return edgeInsets > 0 ? UIEdgeInsetsMake(0, edgeInsets, 0, edgeInsets) : UIEdgeInsetsMake(0, cellSpacing, 0, cellSpacing)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        cell.layer.cornerRadius = 0
//        cell.backgroundColor = UIColor.brown
//    }
//    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        layoutDelegate?.ControllerItemChoosed!(id: indexPath.row + 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellPadding: CGFloat = 53
        let width: CGFloat = 80 + cellPadding
        let height: CGFloat = 80
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 18, left: 8, bottom: 18, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
