//
//  MNTabBarViewController.swift
//  ManNiu
//
//  Created by jiang on 16/10/22.
//  Copyright © 2016年 网无际. All rights reserved.
//

import UIKit

class MNTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    var isTabbarHidden = false
    var firstVCArr = [UIViewController]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.zjInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.zjInit()
//        fatalError("init(coder:) has not been implemented")
    }
    private func zjInit() {
        var vcarray = [UINavigationController]()
        
        let mainVM = MNLoginViewModel()
        let mainVC = MNLoginViewController.init(model: mainVM)
        let mainNav = MNNavigationController(rootViewController: mainVC)
        vcarray.append(mainNav)
        firstVCArr.append(mainVC)
        
        self.viewControllers = vcarray

        let imgs = ["首页"]
        let tabbarTitles = ["首页"]
        let selectedImages = ["首页"]
        
        for (index, _) in vcarray.enumerate() {
            var temimg = UIImage.init(named: imgs[index])
            temimg = temimg?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
            let nav = vcarray[index]
            nav.tabBarItem.image = temimg
            nav.tabBarController?.tabBar.tintColor = UIColor.blackColor()
            nav.tabBarItem.title = tabbarTitles[index]
            nav.tabBarItem.selectedImage = UIImage.init(named: selectedImages[index])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
    }
    func setTabbarHiddenMN(isH: Bool) {
        if isH != self.tabBar.hidden {
            if isH {
                if self.tabBar.y >= kHeight {
                    return
                }
                UIView.animateWithDuration(0.2, animations: {
                    
                    self.tabBar.y += 49
                    
                    }, completion: { (finished) in
                        
                        self.tabBar.hidden = isH
                        
                })
            }
            else {
                if self.tabBar.y <= kHeight - 49 {
                    return
                }
                self.tabBar.hidden = isH
                UIView.animateWithDuration(0.2, animations: { 
                    
                    self.tabBar.y -= 49
                    
                    }, completion: { (finished) in
                        
                })
            }
        }
    }
    func zj_TBcallTheTabbar(willcurVC: UIViewController) {
        if firstVCArr.contains(willcurVC) {
            self.setTabbarHiddenMN(false)
        }
        else {
            self.setTabbarHiddenMN(true)
        }
    }
}
