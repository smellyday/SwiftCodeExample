//
//  ViewController.swift
//  StackView
//
//  Created by owen on 11/5/15.
//  Copyright © 2015 owen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainStackview: UIStackView = UIStackView(frame: CGRectMake(0, 0, 300, 300))
    let redview: UIView = UIView()
    let blueview: UIView = UIView()
    let yellowview: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        redview.backgroundColor = UIColor.redColor()
        blueview.backgroundColor = UIColor.blueColor()
        yellowview.backgroundColor = UIColor.yellowColor()
        
        mainStackview.addArrangedSubview(redview)
        mainStackview.addArrangedSubview(blueview)
        mainStackview.addArrangedSubview(yellowview)
        
        mainStackview.axis = UILayoutConstraintAxis.Vertical
        mainStackview.distribution = UIStackViewDistribution.FillEqually
        mainStackview.alignment = UIStackViewAlignment.Center
        
        redview.widthAnchor.constraintEqualToAnchor(nil, multiplier: 1, constant: 80).active = true
        blueview.widthAnchor.constraintEqualToAnchor(nil, multiplier: 1, constant: 800).active = true
        yellowview.widthAnchor.constraintEqualToAnchor(nil, multiplier: 1, constant: 120).active = true
        
        
        self.view.addSubview(mainStackview)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

