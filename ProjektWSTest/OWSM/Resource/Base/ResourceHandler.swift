//
//  WebService.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

let baseHTTPRoute = "https://appbooktest.in2.hr/ords/appbookrest/"

/**
Performs generic check for resource

If data does not exist, or refresh flag is set, performs WS call with oberver func as callback
*/
func checkResourceData(data: Any?, route: String, params: [String : String]? = nil, refresh: Bool = false, observer: (data: AnyObject?, error: HTTPRequestError?) -> Void) -> Any?{
    
    if data == nil || refresh{
        HTTPRequestManager.instance.get(
            route,
            params: params,
            observer: responseErrorHandling(observer))
        
        return nil
    }
    
    return data
}

/// Handles generic HTTP response error handling
func responseErrorHandling(observer: (data: AnyObject?, error: HTTPRequestError?) -> Void)(data: AnyObject?, error: HTTPRequestError?){
    
    if let error = error{
        print(error)
        observer(data: nil, error: error)
    }else{
        if let data = data{
            observer(data: data, error: nil)
        }else{
            observer(data: nil, error: HTTPRequestError.NoDataOnSuccess)
        }
    }
}

