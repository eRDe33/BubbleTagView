//
//  BubbleTagViewCellConfiguration.swift
//  Pods
//
//  Created by Radek Dolezal on 11.12.15.
//
//

import UIKit

public class BubbleTagViewCellConfiguration {
    public var cellColor: UIColor
    public var font: UIFont
    public var fontColor: UIColor
    
    public var selectedFont: UIFont?
    public var selectedFontColor: UIColor?
    public var selectedCellColor: UIColor?
    
    public var cellBorderColor: UIColor?
    public var selectedCellBorderColor: UIColor?
    
    public var cornerRadius: CGFloat?
    public var insets: UIEdgeInsets?
    
    public init(cellColor: UIColor, font: UIFont, fontColor: UIColor) {
        self.cellColor = cellColor
        self.font = font
        self.fontColor = fontColor
    }
    
    public init(cellColor: UIColor, font: UIFont, fontColor: UIColor, cornerRadius: CGFloat?, insets: UIEdgeInsets?) {
        self.cellColor = cellColor
        self.font = font
        self.fontColor = fontColor
        self.cornerRadius = cornerRadius
        self.insets = insets
    }
}
