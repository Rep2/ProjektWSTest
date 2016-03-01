//
//  Task.swift
//  Appbook
//
//  Created by Rep on 3/1/16.
//  Copyright © 2016 iOS pro team. All rights reserved.
//

import Foundation

struct Task{
    
    let id:String
    let naziv:String
    let lobovi:[Lob]
    
    
    static func arrayFromJSON(data:[[String:AnyObject]]) -> [Task]{
        
        var array = [Task]()
        
        for entity in data{
            array.append(Task(id: entity["task_id"] as? String ?? "",
                naziv: entity["task_name"] as? String ?? "",
                lobovi: Lob.arrayFromJSON(entity["lobovi"] as? [[String:AnyObject]] ?? [])))
        }
        
        return array
    }
}
