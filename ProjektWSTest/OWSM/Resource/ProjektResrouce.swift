//
//  ProjektResrouce.swift
//  Appbook
//
//  Created by Rep on 3/1/16.
//  Copyright © 2016 iOS pro team. All rights reserved.
//

import Foundation

class ProjektResrouce{
    
    static var instance = ProjektResrouce()
    
    let route = baseHTTPRoute + "pn/sifarnik/projsoclob/22"
    
    var models: [Projekt]?
    
    func getAll(refresh: Bool = false, observer: (data: [Projekt]?, error: HTTPRequestError?) -> Void) -> [Projekt]? {
        return checkResourceData(models, route: route, refresh: refresh,
            observer: parseCollectionToModel(observer)) as? [Projekt]
    }
    
    func parseCollectionToModel(observer: ((data: [Projekt]?, error: HTTPRequestError?) -> Void)? = nil)
        (data: AnyObject?, error: HTTPRequestError?) -> Void {
        
        if let dataArray = data as? [[String : AnyObject]]{
            models = Projekt.arrayFromJSON(dataArray)
        }
        
        if let observer = observer{
            observer(data: models, error: error)
        }
    }
    
}

