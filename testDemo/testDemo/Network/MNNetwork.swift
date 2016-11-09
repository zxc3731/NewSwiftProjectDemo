//
//  HLNetwork.swift
//  yios
//
//  Created by 江 on 16/7/26.
//  Copyright © 2016年 江. All rights reserved.
//

import UIKit
import Alamofire
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif
enum NetWorkResult<T> {
    case value(T)
    case error(String)
}
typealias Finished = ((objc: [String: AnyObject]?, error: NSError?, badNetwork: BooleanType?) -> ())?
typealias Success = ((objc: AnyObject!) -> ())?
typealias ErrorFunc = ((objc: String!) -> ())?
class MNNetwork: Alamofire.Manager {
    static let tool: MNNetwork = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
        config.timeoutIntervalForRequest = 60.0
        config.HTTPMaximumConnectionsPerHost = 1
        return MNNetwork(configuration: config)
    }()
    
    class func shareNetwork() -> MNNetwork {
        return tool
    }

    func responseJSONMN<T: MNModelProtocol>(request: URLRequestConvertible,
                        type: T,
                        success: ((T!) -> ())?,
                        fail: ((String!) -> ())?
                        ) -> Observable<NetWorkResult<T>> {
        
        return Observable.create { observer -> Disposable in
            
            let request = MNNetwork.shareNetwork().request(request).responseJSON { (response: Response<AnyObject, NSError>) in
                
                // 以下读取测试数据，模拟真实请求
                let temp = NSBundle.mainBundle().pathForResource("testJson", ofType: "json")
                let str = try! NSString.init(contentsOfFile: temp!, encoding: NSUTF8StringEncoding)
                let da = str.dataValue()
                let dict = try! NSJSONSerialization.JSONObjectWithData(da!, options: NSJSONReadingOptions.AllowFragments)
                
                let model = T.modelWithJSONMN(dict as! [String : AnyObject])
                if let tempModel = model {
                    if let tempSuccess = success {
                        tempSuccess(tempModel)
                    }
                    observer.onNext(NetWorkResult.value(tempModel))
                }
                
//                if response.result.isSuccess {
//                    if let dict = response.result.value as? [String: AnyObject] {
//                        let model = T.modelWithJSONMN(dict)
//                        if let tempModel = model {
//                            if let tempSuccess = success {
//                                tempSuccess(tempModel)
//                            }
//                            observer.onNext(NetWorkResult.value(tempModel))
//                        }
//                        else {
//                            let objc = "数据解析失败"
//                            if let tempFail = fail {
//                                tempFail(objc)
//                            }
//                            observer.onNext(NetWorkResult.error(objc))
//                        }
//                    }
//                    
//                }
//                else {
//                    let objc = "网络异常"
//                    
//                    if let tempFail = fail {
//                        tempFail(objc)
//                    }
//                    observer.onNext(NetWorkResult.error(objc))
//                }
            }
            return AnonymousDisposable {
                request.cancel()
            }
        }
    }
}
