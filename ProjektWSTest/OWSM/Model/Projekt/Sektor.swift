//
//  Sektor.swift
//  Appbook
//
//  Created by Rep on 3/1/16.
//  Copyright © 2016 iOS pro team. All rights reserved.
//

import Foundation

struct Sektor{
    
    let id:Int
    let naziv:String
    let def:Bool
    
    static func arrayFromJSON(data:[[String:AnyObject]]) -> [Sektor]{
        
        var array = [Sektor]()
        
        for entity in data{
            array.append(Sektor(id: entity["soc_id"] as? Int ?? -1,
                naziv: entity["sektor"] as? String ?? "",
                def: (entity["default"] as? String ?? "N") == "D"))
        }
        
        return array
    }
    
}