//
//  Error.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 12/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

enum HTTPRequestError: ErrorType{
    
    case NoInternetConnection
    
    case StatusCode(Int)
    
    case UnvalidResponse
    
    case NoDataOnSuccess
    
}