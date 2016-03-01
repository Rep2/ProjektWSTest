//
//  HTTPRequest.swift
//  Surveys
//
//  Created by Rep on 11/7/15.
//  Copyright © 2015 Rep. All rights reserved.
//

import Foundation
import AFNetworking

/// Handles HTTP requests
class HTTPRequestManager{
    
    static let instance = HTTPRequestManager()
    
    /// AFNetworking session manager
    let manager = AFHTTPSessionManager()
    
    init(){
        manager.responseSerializer = AFJSONResponseSerializer()
        
        manager.responseSerializer.acceptableContentTypes = ["text/html","application/json"]
    }
    
    /**
     Get request
     
     - parameter route: URL string of the web service endpoint
     - parameter params: Dicitionary containing parameters
     - parameter observer: Observer function
    */
    func get(route:String, params:[String:String]? = nil, observer: ((data: AnyObject?, error: HTTPRequestError?) -> Void)? = nil){
        
        let responseHandler = HTTPResponseHandler(listener: observer)
        
        manager.GET(route,
            parameters: params,
            progress: nil,
            success: responseHandler.success,
            failure: responseHandler.failure)
    }
    
    /**
     Post request
     
     - parameter route: URL string of the web service endpoint
     - parameter params: Dicitionary containing parameters
     - parameter observer: Observer function
     */
    func post(route:String, params:[String:String]? = nil, observer: ((data: AnyObject?, error: HTTPRequestError?) -> Void)? = nil){
        
        let responseHandler = HTTPResponseHandler(listener: observer)
        
        manager.POST(route,
            parameters: params,
            constructingBodyWithBlock: nil,
            progress: nil,
            success: responseHandler.success,
            failure: responseHandler.failure)
    }
    
    /// Sets request header field to given value
    func setSessionHeader(value:String?, field:String){
        manager.requestSerializer.setValue(value, forHTTPHeaderField: field)
    }
}