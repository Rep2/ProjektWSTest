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
    
    var projekti: [Projekt]?
    var lobovi: [Lob]?
    
    func getProjekti(refresh: Bool = false, observer: (data: [Projekt]?, error: HTTPRequestError?) -> Void) -> [Projekt]? {
        return checkResourceData(projekti, route: route, refresh: refresh,
            observer: parseCollectionToModel(getProjektiAsyn(observer))) as? [Projekt]
    }
    
    func getLobovi(refresh: Bool = false, observer: (data: [Lob]?, error: HTTPRequestError?) -> Void) -> [Lob]?{
        return checkResourceData(projekti, route: route, refresh: refresh,
            observer: parseCollectionToModel(getLoboviAsyn(observer))) as? [Lob]
    }
    
    /// Parses whole response runs given async return func
    func parseCollectionToModel(observer: ((error: HTTPRequestError?) -> Void)? = nil)
        (data: AnyObject?, error: HTTPRequestError?) -> Void {
        
        if let dataArray = data as? [[String : AnyObject]]{
            let parsedData = Projekt.arrayFromJSON(dataArray)
            projekti = parsedData.0
            lobovi = parsedData.1
        }
        
        if let observer = observer{
            observer(error: error)
        }
    }
    
    func getProjektiAsyn(observer: (data: [Projekt]?, error: HTTPRequestError?) -> Void)(error: HTTPRequestError?){
        observer(data: projekti, error: error)
    }
    
    func getLoboviAsyn(observer: (data: [Lob]?, error: HTTPRequestError?) -> Void)(error: HTTPRequestError?){
        observer(data: lobovi, error: error)
    }
    
}

