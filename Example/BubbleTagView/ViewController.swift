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
        
        let items =  ["Travel","Super long tag","Cultura","Food","Sport"]
        
        bubbleTagView.bubbleDelegate = self
        bubbleTagView.allowsMultipleSelection = true
        bubbleTagView.setTags(items)
    }
    
    @IBAction func useCustomizedCells(sender: AnyObject) {
        let cellConfiguration = BubbleTagViewCellConfiguration(cellColor: UIColor.blackColor(), font: UIFont.boldSystemFontOfSize(10), fontColor: UIColor.whiteColor(), insets: UIEdgeInsetsMake(0, 0, 0, 0), cornerRadius: 2.0)
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

