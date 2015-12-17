//
//  TagView.swift
//  tagCollectionView
//
//  Created by Michal Šimík on 12.11.15.
//  Copyright © 2015 Michal Šimík. All rights reserved.
//

import UIKit
import UICollectionViewLeftAlignedLayout

public protocol BubbleTagViewDelegate {
    
    func bubbleTagView(bubbleTagView: BubbleTagView, didSelectTagAtIndexPath indexPath:NSIndexPath);
    func bubbleTagView(bubbleTagView: BubbleTagView, didDeselectTagAtIndexPath indexPath:NSIndexPath);
    
}

extension BubbleTagViewDelegate {
    
    func bubbleTagView(bubbleTagView: BubbleTagView, didSelectTagAtIndexPath indexPath:NSIndexPath) {}
    func bubbleTagView(bubbleTagView: BubbleTagView, didDeselectTagAtIndexPath indexPath:NSIndexPath) {}
}


@IBDesignable public class BubbleTagView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateLeftAlignedLayout {
    
    public var cellConfiguration: BubbleTagViewCellConfiguration = BubbleTagViewCellConfiguration(cellColor: UIColor.lightGrayColor(), font: UIFont.systemFontOfSize(10), fontColor: UIColor.blackColor()) {
        willSet(cellConfiguration) {
            self.sizingLabel.font = cellConfiguration.font
            self.reloadData()
            self.collectionViewLayout.invalidateLayout()
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public var minimumLineSpacing : CGFloat = 3.0 {
        willSet(minimumLineSpacing) {
            self.collectionViewLayout.invalidateLayout()
            self.invalidateIntrinsicContentSize()
        }
    }

    public var minimumInteritemSpacing : CGFloat = 3.0 {
        willSet(minimumIteritemSpacing) {
            self.collectionViewLayout.invalidateLayout()
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public var bubbleDelegate : BubbleTagViewDelegate?
    
    var items:[String] =  []
    
    private var sizingLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.collectionViewLayout = UICollectionViewLeftAlignedLayout()
        self.customInit()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLeftAlignedLayout())
        self.customInit()
    }
    
    func customInit() {
        self.sizingLabel = UILabel(frame: CGRectMake(0, 0, 100, 50))
        self.sizingLabel.font = self.cellConfiguration.font
        self.registerClass(BubbleTagViewCell.self, forCellWithReuseIdentifier: "TagCell")
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor.clearColor()
        self.scrollEnabled = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    // MARK: - Designable
    
    public override func prepareForInterfaceBuilder() {
        self.setTags(["hashtag1", "hashtag2", "hashtag3"])
    }
    
    //MARK: -public API
    public func setTags(tags: [String]) {
        
        self.items = []
        for tag in tags where tag != ""{
            self.items.append(tag)
        }
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.collectionViewLayout.invalidateLayout() // Invalidate layout
            self.invalidateIntrinsicContentSize(nil) // Invalidate intrinsic size
        }
        
        self.reloadData() // Reload collectionView
        CATransaction.commit()
    }

    
    //MARK: -layout attributes
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return self.minimumLineSpacing
    }
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return self.minimumInteritemSpacing
    }
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let item = self.items[indexPath.item]
        self.sizingLabel.text = item
        self.sizingLabel.sizeToFit()
        let maximumWidth = CGRectGetWidth(collectionView.bounds)
        let size = self.sizingLabel.bounds.size
    
        return CGSizeMake(min(size.width+self.cellConfiguration.insets.left+self.cellConfiguration.insets.right, maximumWidth), size.height+self.cellConfiguration.insets.bottom+self.cellConfiguration.insets.top)
    }
    
    // MARK:- Autolayout
    
    override public func intrinsicContentSize() -> CGSize {
        let size = (self.collectionViewLayout as! UICollectionViewFlowLayout).collectionViewContentSize()
        return CGSizeMake(CGRectGetWidth(self.bounds),  size.height)
    }
    
    private func invalidateIntrinsicContentSize(completionBlock: (() -> ())?) {
        
        if self.intrinsicContentSize() != self.bounds.size {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.invalidateIntrinsicContentSize()
                
                }) { (finished) -> Void in
                    completionBlock?()
            }
        } else {
            completionBlock?()
        }
    }
    
    // MARK: -UICollectionViewDelegate and datasource
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TagCell", forIndexPath: indexPath) as! BubbleTagViewCell
        
        cell.tagLabel.text = self.items[indexPath.row]
        cell.configurateCell(cellConfiguration)

        return cell
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    public override func selectItemAtIndexPath(indexPath: NSIndexPath?, animated: Bool, scrollPosition: UICollectionViewScrollPosition) {
        super.selectItemAtIndexPath(indexPath, animated: animated, scrollPosition: scrollPosition);
        
    }
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        bubbleDelegate?.bubbleTagView(self, didSelectTagAtIndexPath: indexPath)
    }
    
    public func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        bubbleDelegate?.bubbleTagView(self, didDeselectTagAtIndexPath: indexPath)
    }
    
}
