//
//  DCollectionTableViewCell.swift
//  DMarket
//
//  Created by Deethi, Shashidhar (US - Hyderabad) on 4/27/16.
//  Copyright © 2016 Deethi, Shashidhar (US - Hyderabad). All rights reserved.
//

import Foundation
import UIKit

class DIndexedCollectionView: UICollectionView {
    
    var indexPath: NSIndexPath!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

let collectionViewCellIdentifier: NSString = "CollectionViewCell"
class DCollectionTableViewCell: UITableViewCell {
    
    var collectionView: DIndexedCollectionView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(4, 5, 4, 5)
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSizeMake(91, 91)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        self.collectionView = DIndexedCollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellIdentifier as String)
        
        self.collectionView.backgroundColor = UIColor.lightGrayColor()
        
        self.collectionView.showsHorizontalScrollIndicator = false
        
        self.contentView.addSubview(self.collectionView)
        
        self.layoutMargins = UIEdgeInsetsMake(10, 0, 10, 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame = self.contentView.bounds
        self.collectionView.frame = CGRectMake(0, 0.5, frame.size.width, frame.size.height - 1)
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>, index: NSInteger) {
        self.collectionView.dataSource = delegate
        self.collectionView.delegate = delegate
        self.collectionView.tag = index
        self.collectionView.reloadData()
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>, indexPath: NSIndexPath) {
        self.collectionView.dataSource = delegate
        self.collectionView.delegate = delegate
        self.collectionView.indexPath = indexPath
        self.collectionView.tag = indexPath.section
        self.collectionView.reloadData()
    }
}