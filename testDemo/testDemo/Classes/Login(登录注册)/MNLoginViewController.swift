//
//  MNLoginViewController.swift
//  ManNiu
//
//  Created by jiang on 16/10/22.
//  Copyright © 2016年 网无际. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

class MNLoginViewController: MNBaseViewController {

    var vm: MNLoginViewModel!
    var completionWhenDismiss: (()->())? // 当dismiss的时候调用block
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var userNameTextFieldView: UITextField!
    @IBOutlet weak var pwdTextFieldView: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    init(model: MNLoginViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.vm = model
        self.vm.vc = self
    }
    init(model: MNLoginViewModel, completion: (()->Void)?) {
        super.init(nibName: nil, bundle: nil)
        self.vm = model
        self.vm.vc = self
        
        completionWhenDismiss = completion
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vm.everythingValid.bindTo(self.loginButton.rx_enabled).addDisposableTo(self.vm.disposeBag)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        print("dict:\(dict)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- binding
    override func binding() {
        super.binding()
        self.vm.bind()
    }
    //MARK:- delegate回调
    //MARK:- selector/target 事件处理
    @IBAction func testAction(sender: AnyObject) {
        _ = self.vm.getLogin().subscribeNext { [weak self](model) in
            
            switch model {
            case .value(let value):
                self?.testLabel.text = value.successString + ",用户ID:" + value.userID
            case .error(let value):
                self?.testLabel.text = value
            }
            
            }.addDisposableTo(self.vm.disposeBag)
    }
    //MARK:- settingViw设置view
    override func settingView() {
        super.settingView()
    }
    //MARK:- 动画
    //MARK:- 设置约束/frame
    override func layout() {
        super.layout()
    }
    //MARK:- 数据处理
    //MARK:- 网络请求
    //MARK:- 自定义及其他方法

    
}
