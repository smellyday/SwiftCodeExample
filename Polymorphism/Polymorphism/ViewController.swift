//
//  ViewController.swift
//  Polymorphism
//
//  Created by zhangpan on 15/11/12.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ani: Animal = Animal()
        let dog: Animal = Dog()
        let gol: Animal = GoldenDog()
        
        let arr: [Animal] = [ani, dog, gol]
        
        for a in arr {
            a.shout()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

