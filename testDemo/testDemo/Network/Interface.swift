//
//  Interface.swift
//  yios
//
//  Created by 江 on 16/7/26.
//  Copyright © 2016年 江. All rights reserved.
//

import Foundation

struct Interface {
    enum HLService {
        case release, test
    }
    static let kService = HLService.test
    static var kHost: String {
        get {
            if (Interface.kService == HLService.release) {
                return ""
            }
            else if (Interface.kService == HLService.test) {
                return ""
            }
            return ""
        }
    }
    //-----------------------测试－－－－－－－－－－－－－－－－
    static let Test1 = Interface.kHost + "1"
 
}
