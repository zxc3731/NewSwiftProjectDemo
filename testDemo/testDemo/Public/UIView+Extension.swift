//
//  UIView+HLExtension.swift
//  yios
//
//  Created by 江 on 16/8/12.
//  Copyright © 2016年 江. All rights reserved.
//

import UIKit
private var redpoint_CategoryKey: String = "redpoint_CategoryKey"

extension UIView {
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    var w: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newValue) {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    var h: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newValue) {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
}
