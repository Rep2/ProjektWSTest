//
//  Lob.swift
//  Appbook
//
//  Created by Rep on 3/1/16.
//  Copyright © 2016 iOS pro team. All rights reserved.
//

import Foundation

struct Lob{
    
    let id:String
    let naziv:String
    let sektori:[Sektor]
    
    static func arrayFromJSON(data:[[String:AnyObject]]) -> [Lob]{
        
        var array = [Lob]()
        
        for entity in data{
            array.append(Lob(id: entity["lob_id"] as? String ?? "",
                naziv: entity["naziv"] as? String ?? "",
                sektori: Sektor.arrayFromJSON(entity["sektori"] as? [[String:AnyObject]] ?? [])))
        }
        
        return array
    }
    
}