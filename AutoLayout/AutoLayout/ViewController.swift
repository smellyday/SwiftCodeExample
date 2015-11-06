//
//  ViewController.swift
//  AutoLayout
//
//  Created by zhangpan on 15/11/5.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mButton.backgroundColor = UIColor.darkGrayColor()
        mButton.titleLabel?.text = "update Constraint"
        mButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mButton)
        
        mButton.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor, constant: 20).active = true
        mButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: -20).active = true
        /* By now, btn has 'Ambiguous Layout' problem. */
        mButton.widthAnchor.constraintEqualToAnchor(nil, multiplier: 0, constant: 100).active = true
        mButton.heightAnchor.constraintEqualToAnchor(nil, multiplier: 0, constant: 30).active = true
        
        mButton.addTarget(self, action: "changeConstraint", forControlEvents: UIControlEvents.TouchUpInside)
        
        // call functions
        self.addSubViewWithNSLayoutConstraint()
        self.addSubViewWithNSLayoutAnchor()
        self.priorityTest()
    }
    
    func changeConstraint() {
        
        UIView.animateWithDuration(1, animations: {
            self.mButton.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor, constant: -10).active = true
            /* Will cause 'Unsatifiable Layout' problem. But the layout still changes.*/
            self.view.layoutIfNeeded()
        })
        
    }

    func addSubViewWithNSLayoutConstraint() {
        let subview = UIView()
        subview.backgroundColor = UIColor.yellowColor()
        /*
            This is very important to set up.
            Adding subview programingly, UIKit system set this property 'true' by default.
        */
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(subview)
        
        let topCons = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let leadingCons = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        let widthCons = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 0.5, constant: 0)
        let heightCons = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 0.3, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topCons, leadingCons, widthCons, heightCons])
        
        /*
        - addConstraint:
        
        The constraint must involve only views that are within scope of the receiving view. Specifically, any views involved must be either the receiving view itself, or a subview of the receiving view. Constraints that are added to a view are said to be held by that view. The coordinate system used when evaluating the constraint is the coordinate system of the view that holds the constraint.
        
        When developing for iOS 8.0 or later, set the constraint’s active property to YES instead. This automatically adds the constraint to the correct view.
        */
        
        /*
        - removeConstraint:
        
        When developing for iOS 8.0 or later, set the constraint’s active property to NO instead. This automatically removes the constraint from the correct view.
        */
    }
    
    func addSubViewWithNSLayoutAnchor() {
        
        let subview = UIView()
        subview.backgroundColor = UIColor.blueColor()
        /*
        This is very important to set up.
        Adding subview programingly, UIKit system set this property 'true' by default.
        */
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(subview)
        
        subview.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 100).active = true
        subview.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor, constant: 100).active = true
        let trailingCons = subview.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor, constant: -10)
        let bottomCons = subview.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: -200)
        NSLayoutConstraint.activateConstraints([trailingCons, bottomCons])

    }
    
    func priorityTest() {
        
        let subview = UIView()
        subview.backgroundColor = UIColor.redColor()
        /*
        This is very important to set up.
        Adding subview programingly, UIKit system set this property 'true' by default.
        */
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(subview)
        
        let topCons = subview.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 200)
        let leadingCons = subview.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor, constant: 50)
        let trailingCons = subview.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor, constant: -100)
        let bottomCons = subview.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: -250)
        /*By default, every constraint has required priority of '1000'. Priority must be in '1 ... 1000'*/
        
        let bottomCons02 = subview.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor, constant: -30)
        /*This could lead to a 'Unsatisfiable Layout'. 'bottomCons' and 'bottomCons2' have same priority*/
        
        bottomCons02.priority = UILayoutPriorityRequired - 1
        /*Fix the 'Unsatisfiable Layout' problem now*/
        
        NSLayoutConstraint.activateConstraints([topCons, leadingCons, trailingCons, bottomCons, bottomCons02])

        
        let tc = subview.widthAnchor.constraintLessThanOrEqualToAnchor(self.view.widthAnchor, multiplier: 1)
        print("tc priority : \(tc.priority)")
        tc.priority = UILayoutPriorityDefaultHigh
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}

