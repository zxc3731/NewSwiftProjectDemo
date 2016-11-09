//
//  MNLoginViewModel.swift
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
import Alamofire

class MNLoginViewModel: MNBaseViewModel {
    weak var vc: MNLoginViewController! {
        didSet {
            self.setting(vc)
        }
    }
    var everythingValid: Observable<Bool>!
    
    func setting(vc: MNLoginViewController) {
        
    }
    func bind() {
        let usernameValid = vc.userNameTextFieldView.rx_text
            .map{ $0.characters.count > 0 && $0.characters.count < 12 }  //map函数 对text进行处理
            .shareReplay(1)
        
        let passwordValid = vc.pwdTextFieldView.rx_text
            .map{ $0.characters.count > 0 && $0.characters.count < 5 }  //map函数 对text进行处理
            .shareReplay(1)
        
        everythingValid = Observable.combineLatest(usernameValid, passwordValid) { (usernameValid, passwordValid) -> Bool in
            usernameValid && passwordValid
        }
    }
    func getLogin() -> Observable<NetWorkResult<MNLoginModel>> {
        let create = testRouter.Login(phone: "1350303030303", pwd: "111111")
        return MNNetwork.shareNetwork().responseJSONMN(create, type: MNLoginModel(), success: { (model) in
            
            print("po:\(model)")
            
            }, fail: { (error) in

        })
    }
}
