//
//  ViewController.swift
//  InitializerTest
//
//  Created by zhangpan on 15/11/4.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let b = BBB(aaa: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class AAA {
    
    init(a: String) {
        
    }
    
    convenience init(b: String) {
//        self.init(a: b)
//        self.init(cc: b)!
        self.init(dd: b)!
    }
    
    required init(aa: String) {
        
    }
    
    init?(cc: String) {
        
    }
    
    convenience init?(dd: String) {
//        self.init(aaa: dd)
//        self.init(a: dd)
//        self.init(aa: dd)
        self.init(cc: dd)
    }
    
    required init?(aaa: String) {
        
    }
    
    required convenience init?(bbb: String) {
        self.init(cc: bbb)
    }
    
    
}

class BBB: AAA {
    required init(aa: String) {
        super.init(aa: aa)
    }
    
    required convenience init?(aaa: String) {
        self.init(aa: aaa)
    }
    
    required convenience init?(bbb: String) {
        self.init(aaa: bbb)
    }
    
    override init(cc: String) {
        super.init(aaa: cc)!
    }
    
    
}


