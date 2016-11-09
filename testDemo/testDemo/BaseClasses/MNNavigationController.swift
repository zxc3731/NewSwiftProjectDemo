//
//  HLNavigationController.swift
//  yios
//
//  Created by 江 on 16/7/27.
//  Copyright © 2016年 江. All rights reserved.
//

import UIKit

class MNNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    var curvc: UIViewController? // 特定VC停止手势返回
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let target = self.interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer.init(target: target, action: Selector("handleNavigationTransition:"))
        pan.delegate = self;
        self.view.addGestureRecognizer(pan)
    }
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
        // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
        gestureRecognizer.locationInView(gestureRecognizer.view)
        let translation = gestureRecognizer.locationInView(gestureRecognizer.view)
        if (translation.x <= 0) {
            return false;
        }
        
        if (self.childViewControllers.count == 1 || self.childViewControllers.last == curvc) {
            // 表示用户在根控制器界面，就不需要触发滑动手势，
            return false;
        }
        
        return true;
    }
    func slideStop(thevc: UIViewController!) {
        curvc = thevc
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
