//
//  TagViewCell.swift
//  tagCollectionView
//
//  Created by Michal Šimík on 12.11.15.
//  Copyright © 2015 Michal Šimík. All rights reserved.
//

import UIKit

class BubbleTagViewCell: UICollectionViewCell {
    
    var tagLabel : UILabel!
    
    var notSelectedFont : UIFont = UIFont.systemFontOfSize(10) {
        willSet(font) {
            if (!selected) {
                self.tagLabel!.font = font
            }
        }
        
    }
    
    var notSelectedFontColor : UIColor = UIColor.blackColor() {
        willSet(color) {
            if (!selected) {
                self.tagLabel!.textColor = color
            }
        }
    }
    
    
    var notSelectedColor : UIColor = UIColor.grayColor() {
        willSet(color) {
            if (!selected) {
                self.backgroundColor = color
            }
        }
    }
    
    var notSelectedBorderColor : UIColor? {
        didSet(color) {
            setBorders(selected)
        }
    }
    
    
    var selectedFont : UIFont = UIFont.systemFontOfSize(10) {
        willSet(font) {
            
            if (selected) {
                self.tagLabel!.font = font
            }
            
        }
        
    }
    
    var selectedFontColor : UIColor = UIColor.blackColor() {
        willSet(color) {
            if (selected) {
                self.tagLabel!.textColor = color
            }
        }
    }
    
    var selectedColor : UIColor = UIColor.grayColor() {
        willSet(color) {
            if (selected) {
                self.backgroundColor = color
            }
        }
    }
    
    var selectedBorderColor : UIColor? {
        willSet(color) {
           setBorders(selected)
        }
    }
    
    var cornerRadius : CGFloat = 0 {
        willSet(radius) {
            self.layer.cornerRadius = radius
        }
    }
    
    override var selected : Bool {
        willSet(selected) {
            if (selected) {
                self.tagLabel!.font = selectedFont
                self.tagLabel!.textColor = selectedFontColor    
                self.backgroundColor = selectedColor
                

            } else { 
                self.tagLabel!.font = notSelectedFont
                self.tagLabel!.textColor = notSelectedFontColor    
                self.backgroundColor = notSelectedColor
               
            }
            setBorders(selected)
        }
        

    }
    
    private func setBorders(selected : Bool ) {
        if (selected) {
            if let color = selectedBorderColor?.CGColor {
                addBordersWithColor(color)
            } else {
                removeBorders()
            }
        } else {
            if let color = notSelectedBorderColor?.CGColor {
                addBordersWithColor(color)
            } else {
                removeBorders()
            }
        }
    }
    
    private func addBordersWithColor(color : CGColor) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color
    
    }
    
    private func removeBorders() {
        self.layer.borderWidth = 0.0
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        self.layer.cornerRadius = self.layer.frame.height/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 4.0
        
        self.tagLabel = UILabel()
        
        self.tagLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(self.tagLabel)
        initConstraints()
        
        tagLabel.textAlignment = .Center
        self.tagLabel.contentMode = UIViewContentMode.Center
    }
    
    func setText(text:String) {
        tagLabel.text = text
        tagLabel.sizeToFit()
    }
    
    func initConstraints ()  {
        
        let leadingConstraint = NSLayoutConstraint(item: tagLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: tagLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: tagLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: tagLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        contentView.addConstraints([leadingConstraint,trailingConstraint,topConstraint,bottomConstraint])
    }
    
    func configurateCell(cellConfiguration: BubbleTagViewCellConfiguration) {
        self.notSelectedFont = cellConfiguration.font
        self.notSelectedColor = cellConfiguration.cellColor
        self.notSelectedFontColor = cellConfiguration.fontColor
        
        if let selectedFont = cellConfiguration.selectedFont {
            self.selectedFont = selectedFont
        }
        
        if let color = cellConfiguration.selectedCellColor {
            self.selectedColor = color
        }
        
        if let color = cellConfiguration.selectedFontColor {
            self.selectedFontColor = color
        }
        
        self.notSelectedBorderColor = cellConfiguration.borderColor
        self.selectedBorderColor = cellConfiguration.selectedBorderColor
        
        if let cornerRadius = cellConfiguration.cornerRadius {
            self.cornerRadius = cornerRadius
        }
    }

}
