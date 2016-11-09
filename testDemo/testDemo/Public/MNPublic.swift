//
//  HLPublic.swift
//  yios
//
//  Created by 江 on 16/7/27.
//  Copyright © 2016年 江. All rights reserved.
//

import UIKit
// Public
let kWidth = UIScreen.mainScreen().bounds.size.width
let kHeight = UIScreen.mainScreen().bounds.size.height
func ImageUrl(str: String?) -> NSURL {
    if let temp = str {
        return NSURL.init(string: temp)!
    }
    else {
        return NSURL.init(string: "")!
    }
}

// 颜色
func defauleColor() -> UIColor {
    return UIColor.lightGrayColor()
}
func kColor(R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1)
}
// NSUserDefault
let uDefault = NSUserDefaults.standardUserDefaults()

// 文字大小适配
func f(num: CGFloat) -> UIFont {
    return UIFont.systemFontOfSize(num)
}
func fAndN(num: CGFloat, fontName: String) -> UIFont {
    let temp = UIFont.init(name: fontName, size: num)
    if let t = temp {
        return t
    }
    else {
        return f(num)
    }
}
func fb(num: CGFloat) -> UIFont {
    return UIFont.boldSystemFontOfSize(num)
}

// 当前设备版本

// 公共函数
