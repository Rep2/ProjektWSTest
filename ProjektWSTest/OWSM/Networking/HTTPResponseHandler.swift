//
//  HTTPResponseHandler.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 12/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

/// Implements success and failure callback functions for HTTP Request
class HTTPResponseHandler{
    
    /// Observer func
    let listener: ((data: AnyObject?, error: HTTPRequestError?) -> Void)?
    
    init(listener: ((data: AnyObject?, error: HTTPRequestError?) -> Void)? = nil){
        self.listener = listener
    }
    
    /// On success returns data recived from WS call
    func success(operation:NSURLSessionDataTask, data:AnyObject?){
        if let listener = listener{
            listener(data: data, error: nil)
        }
    }
    
    /// On failure handles failure and returns correct error
    func failure(operation:NSURLSessionDataTask?, error:NSError){
        var httpError: HTTPRequestError
        
        if error.code == -1009{
            httpError = HTTPRequestError.NoInternetConnection
        }else{
            if let operation = operation{
                
                // Parse errors from response body
              
                
                
                if let response = operation.response as? NSHTTPURLResponse{
                    httpError = HTTPRequestError.StatusCode(response.statusCode)
                }else{
                    httpError = HTTPRequestError.StatusCode(-1)
                }
            }else{
                httpError = HTTPRequestError.UnvalidResponse
            }
        }
        
        if let listener = listener{
            listener(data: nil, error: httpError)
        }
    }
}