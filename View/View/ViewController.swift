//
//  ViewController.swift
//  View
//
//  Created by zhangpan on 15/11/5.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var aview: AAView!
    var subview: AAView?
    
    @IBAction func onClickFrameBtn() {
        print("\n\n ====> Frame Button: \(__FUNCTION__)")
        var nFrame = aview.frame
        nFrame.size.width += 20
        aview.frame = nFrame
    }
    
    @IBAction func onClickColorBtn() {
        print("\n\n ====> Color Button: \(__FUNCTION__)")
        aview.backgroundColor = UIColor.brownColor()
    }
    
    @IBAction func onClickContraintBtn() {
        print("\n\n ====> Constraint Button: \(__FUNCTION__)")
        
    }
    
    @IBAction func onClickAddsubviewBtn() {
        print("\n\n ====> Add Subview Button: \(__FUNCTION__)")
        
        subview = AAView(frame: CGRectMake(10, 10, 10, 10))
        subview?.viewName = "SubView"
        subview!.translatesAutoresizingMaskIntoConstraints = false
        subview!.backgroundColor = UIColor.redColor()
        aview.addSubview(subview!)
        
        let topCons = subview?.topAnchor.constraintEqualToAnchor(aview.topAnchor, constant: 10)
        let botCons = subview?.bottomAnchor.constraintEqualToAnchor(aview.bottomAnchor, constant: -10)
        let ledCons = subview?.leadingAnchor.constraintEqualToAnchor(aview.leadingAnchor, constant: 10)
        let traCons = subview?.trailingAnchor.constraintEqualToAnchor(aview.trailingAnchor, constant: -10)
        let traCons2 = subview?.trailingAnchor.constraintEqualToAnchor(aview.trailingAnchor, constant: -30)
        print("traCons priority : \(traCons?.priority)")
        print("traCons2 priority : \(traCons2!.priority)")
        traCons2?.priority--
        
        NSLayoutConstraint.activateConstraints([topCons!, botCons!, ledCons!, traCons!, traCons2!])
        
        print("============================ subview intrinsic content size : \(subview!.intrinsicContentSize())")
        
        let label = UILabel()
        label.text = "Hello"
        self.view.addSubview(label)
        print("============================ subview intrinsic content size : \(label.intrinsicContentSize())")
    }

    @IBAction func onClickTransformBtn() {
        
        if let view = aview.viewWithTag(1) {
//            UIView.animateWithDuration(1, animations: {
//                let rotateTransform = CGAffineTransformMakeRotation(180)
//                UIView.setAnimationRepeatCount(2.5)
//                view.transform = rotateTransform
//            })
            
            UIView.animateWithDuration(1, animations: {
                let rotateTransform = CGAffineTransformMakeRotation(180)
                view.transform = rotateTransform
            }, completion: {(finished: Bool) in
                
                UIView.animateWithDuration(1, animations: {
                    let rotateTransform = CGAffineTransformMakeRotation(180)
                    view.transform = rotateTransform
                    }, completion: nil)
                
            })
        }
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellowColor()
        
        aview.viewName = "FatherView"
        
        /* UIView contentMode */
        aview.contentMode = UIViewContentMode.Right
        
        /* UIView clipsToBounds */
        let bigView = UIView(frame: CGRectMake(100, 100, 50, 50))
        bigView.backgroundColor = UIColor.greenColor()
        bigView.tag = 1
        aview.addSubview(bigView)
        aview.clipsToBounds = true
        
        /* UIView userInteractionEnabled could affact view's subview */
        self.view.userInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

