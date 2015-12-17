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
    
    public var borderColor: UIColor?
    public var selectedBorderColor: UIColor?
    
    public var cornerRadius: CGFloat?
    public var insets: UIEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10)
    
    public init(cellColor: UIColor, font: UIFont, fontColor: UIColor) {
        self.cellColor = cellColor
        self.font = font
        self.fontColor = fontColor
    }
    
    public init(cellColor: UIColor, font: UIFont, fontColor: UIColor, insets: UIEdgeInsets, cornerRadius: CGFloat?) {
        self.cellColor = cellColor
        self.font = font
        self.fontColor = fontColor
        self.insets = insets
        self.cornerRadius = cornerRadius
    }
    
    public init(cellColor: UIColor, font: UIFont, fontColor: UIColor, insets: UIEdgeInsets, cornerRadius: CGFloat?, selectedCellColor: UIColor?,selectedFont: UIFont?, selectedFontColor: UIColor?, borderColor: UIColor?, selectedBorderColor: UIColor?) {
        self.cellColor = cellColor
        self.font = font
        self.fontColor = fontColor
        self.insets = insets
        self.cornerRadius = cornerRadius
        self.selectedCellColor = selectedCellColor
        self.selectedFont = selectedFont
        self.selectedFontColor = selectedFontColor
        self.borderColor = borderColor
        self.selectedBorderColor = selectedBorderColor
    }
}
