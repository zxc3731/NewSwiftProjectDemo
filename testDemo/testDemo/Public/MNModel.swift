//
//  HLModel.swift
//  yios
//
//  Created by 江 on 16/8/2.
//  Copyright © 2016年 江. All rights reserved.
//

import Foundation
protocol MNModelProtocol {
    static func modelWithJSONMN(dict: [String: AnyObject]) -> Self?
}
class MNModel: NSObject, MNModelProtocol {
    static func modelWithJSONMN(dict: [String : AnyObject]) -> Self? {
        return self.modelWithJSON(dict)
    }
    func modelArray<T: NSObject>(dic: NSDictionary, key: String, type: T) -> Array<T> {
        var temp: [T] = []
        if dic[key] is NSArray {
            for item in dic[key] as! NSArray {
                let tempItem = item as? NSDictionary
                temp.append(T.modelWithJSON(tempItem ?? []) ?? T())
            }
        }
        return temp
    }
    override var debugDescription: String {
        return self.modelDescription()
    }
    override var description: String {
        return self.modelDescription()
    }
}

class ModelClass: MNModel {
    var identity: IdentityClass = IdentityClass()
    var students: Array<Student> = []
    class func modelContainerPropertyGenericClass() -> NSDictionary {
        return [
            "identity": IdentityClass.self,
        ]
    }
    func modelCustomTransformFromDictionary(dic: NSDictionary) -> Bool {
        students = self.modelArray(dic, key: "students", type: Student())
        return true
    }
}

class IdentityClass: MNModel {
    var name = ""
    var shenfen = ""
}
class Student: MNModel {
    var name = ""
    var xuehao = ""
    var age = ""
}
/******注册登录模块******/
class MNLoginModel: MNModel {
    var successString = ""
    var userID = ""
}



