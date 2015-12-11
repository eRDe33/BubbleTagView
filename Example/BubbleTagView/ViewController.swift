//
//  ViewController.swift
//  BubbleTagView
//
//  Created by Michal Šimík on 11/13/2015.
//  Copyright (c) 2015 Michal Šimík. All rights reserved.
//

import UIKit
import BubbleTagView

class ViewController: UIViewController, BubbleTagViewDelegate {

    @IBOutlet weak var bubbleTagView: BubbleTagView! 
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items =  ["Cultura","Food","Sport","Travel"]
        
        bubbleTagView.bubbleDelegate = self
        bubbleTagView.setHorizontalAlignment(.Center)
        bubbleTagView.cellColor = UIColor.greenColor()
        bubbleTagView.cellBorderColor = UIColor.blueColor()
        bubbleTagView.fontColor = UIColor.blueColor()

        bubbleTagView.allowsMultipleSelection = true
        
        bubbleTagView.setTags(items)        

        bubbleTagView.insets = UIEdgeInsetsMake(20,20,20,20)
        
    
    }
    
    @IBAction func useCustomizedCells(sender: AnyObject) {
        let cellConfiguration = BubbleTagViewCellConfiguration(cellColor: UIColor.lightGrayColor(), font: UIFont.systemFontOfSize(10), fontColor: UIColor.darkGrayColor(), cornerRadius: 2, insets: UIEdgeInsetsMake(0, 5, 0, 5))
        self.bubbleTagView.cellConfiguration = cellConfiguration
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bubbleTagView(bubbleTagView: BubbleTagView, didDeselectTagAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func bubbleTagView(bubbleTagView: BubbleTagView, didSelectTagAtIndexPath indexPath: NSIndexPath) {

    }
}

