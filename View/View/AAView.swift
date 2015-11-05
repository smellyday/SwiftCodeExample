//
//  AAView.swift
//  View
//
//  Created by zhangpan on 15/11/5.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class AAView: UIView {
    
    var viewName: String?
    
    required init?(coder aDecoder: NSCoder) {
        
        print("\(viewName) -> \(__FUNCTION__)")
        
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        print("\(viewName) -> \(__FUNCTION__)")
        
        super.init(frame: frame)
    }
    
    
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        
        print("\(viewName) -> \(__FUNCTION__)")
        
        super.willMoveToSuperview(newSuperview)
    }
    
    override func didMoveToSuperview() {
        
        print("\(viewName) -> \(__FUNCTION__)")
        
        super.didMoveToSuperview()
    }
    
    override func willMoveToWindow(newWindow: UIWindow?) {
        
        print("\(viewName) -> \(__FUNCTION__)")
        
        super.willMoveToWindow(newWindow)
    }
    
    override func didMoveToWindow() {
        
        print("\(viewName) -> \(__FUNCTION__)")
        
        super.didMoveToWindow()
    }

    override func needsUpdateConstraints() -> Bool {
        
        print("\(viewName) -> \(__FUNCTION__)")

        return super.needsUpdateConstraints()
    }
    
    override func setNeedsUpdateConstraints() {
        
        print("\(viewName) -> \(__FUNCTION__)")
        
        super.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        
        print("\(viewName) -> \(__FUNCTION__)")

        super.updateConstraints()
    }
    
    override func updateConstraintsIfNeeded() {
        
        print("\(viewName) -> \(__FUNCTION__)")

        super.updateConstraintsIfNeeded()
    }
    
    
    
    /*
    Subclasses can override this method as needed to perform more precise layout of their subviews. You should override this method only if the autoresizing and constraint-based behaviors of the subviews do not offer the behavior you want. You can use your implementation to set the frame rectangles of your subviews directly.
    
    You should not call this method directly. If you want to force a layout update, call the setNeedsLayout method instead to do so prior to the next drawing update. If you want to update the layout of your views immediately, call the layoutIfNeeded method.
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        print("\(viewName) -> \(__FUNCTION__)")

    }
    
    override func setNeedsLayout() {
        
        print("\(viewName) -> \(__FUNCTION__)")

        super.setNeedsLayout()
    }
    
    override func layoutIfNeeded() {
        
        print("\(viewName) -> \(__FUNCTION__)")

        super.layoutIfNeeded()
    }
    
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        print("\(viewName) -> \(__FUNCTION__)")
        
        // Drawing code.
        //获得处理的上下文
        let context = UIGraphicsGetCurrentContext();
        //设置线条样式
        CGContextSetLineCap(context, CGLineCap.Square);
        //设置线条粗细宽度
        CGContextSetLineWidth(context, 1.0);
        
        //设置颜色
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
        //开始一个起始路径
        CGContextBeginPath(context);
        //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
        CGContextMoveToPoint(context, 0, 0);
        //设置下一个坐标点
        CGContextAddLineToPoint(context, 100, 100);
        //设置下一个坐标点
        CGContextAddLineToPoint(context, 0, 150);
        //设置下一个坐标点
        CGContextAddLineToPoint(context, 50, 180);
        //连接上面定义的坐标点    
        CGContextStrokePath(context);
    }

    override func setNeedsDisplay() {
        
        print("\(viewName) -> \(__FUNCTION__)")

        super.setNeedsDisplay()
    }
    
    override func setNeedsDisplayInRect(rect: CGRect) {
        
        print("\(viewName) -> \(__FUNCTION__)")

        super.setNeedsDisplayInRect(rect)
    }
    
    
}





























