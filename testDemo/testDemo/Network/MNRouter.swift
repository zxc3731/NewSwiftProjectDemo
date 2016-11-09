//
//  MNRouter.swift
//  ManNiu
//
//  Created by jiang on 16/10/20.
//  Copyright © 2016年 网无际. All rights reserved.
//

import Foundation
import Alamofire
let AF = Alamofire.ParameterEncoding.URL
enum testRouter: URLRequestConvertible {
    
    case Login(phone: String, pwd: String)
    
    var relation: (method: Alamofire.Method, path: String, params: [String: String]?) {
        switch self {
        case .Login(let phone, let pwd):
            return (Alamofire.Method.POST, Interface.Test1, ["loginphone": phone, "loginpassword": pwd])
        }
    }
    var URLRequest: NSMutableURLRequest {
        let url = NSURL.init(string: relation.path)
        let mRequest = NSMutableURLRequest.init(URL: url!)
        mRequest.HTTPMethod = relation.method.rawValue
        mRequest.setValue("xxx", forHTTPHeaderField: "token")
        
        return AF.encode(mRequest, parameters: relation.params).0
    }
}
