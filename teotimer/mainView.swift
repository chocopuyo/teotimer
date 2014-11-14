//
//  mainView.swift
//  teotimer
//
//  Created by chocopuyo on 2014/11/15.
//  Copyright (c) 2014年 chocopuyo. All rights reserved.
//

import UIKit


class mainView: UIView {
    override func drawRect(rect: CGRect) {
        let w = self.frame.size.height/2-100
        let h = self.frame.size.width/2-100

        var ctx = UIGraphicsGetCurrentContext(); //1. 描画されるものの指定
        var r1 = CGRectMake(h , w, 200.0, 200.0);
        CGContextAddEllipseInRect(ctx,r1);
        CGContextStrokePath(ctx);
//        CGContextFillPath(ctx);
    }
}
