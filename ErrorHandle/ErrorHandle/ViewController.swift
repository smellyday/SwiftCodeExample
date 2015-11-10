//
//  ViewController.swift
//  ErrorHandle
//
//  Created by zhangpan on 15/11/9.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

enum TGError: ErrorType {
    case Error01
    case Error02
    case Error03
    case Error04
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            try self.textFunction(5)
            try self.textFunction(4)
            try self.textFunction(3)
            try self.textFunction(2)
            try self.textFunction(1)
        } catch {
            /* Why 'error' here is right??? */
            print(error)
        }
        
        try! self.lookforSomething("")
        print("\n\n")
        try? self.lookforSomething("hello")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFunction(a: Int) throws {
        print("para : \(a)")
        
        guard a > 1 else {
            print("guard a > 1")
            throw TGError.Error01
        }
        
        guard a > 2 else {
            print("guard a > 2")
            throw TGError.Error02
        }
        
        guard a > 3 else {
            print("guard a > 3")
            throw TGError.Error03
        }
        
        guard a > 4 else {
            print("guard a > 4")
            throw TGError.Error04
        }
        
    }
    
    func lookforSomething(name:String) throws {
        //这里是作用域1 整个函数作用域
        print("1-1")
        if name == ""{
            //这里是作用域2 if的作用域
            print("2-1")
            
            defer{
                print("2-2")
            }
            print("2-3")
        }
        
        print("1-2")
        
        defer{
            print("1-3")
        }
        
        print("1-4")
        
        if name == "hello"{
            //作用域3
            print("3-1")
            defer{
                print("3-2")
            }
            
            print("3-3")
            defer{
                print("3-4")
            }
            
        }
    }


}

