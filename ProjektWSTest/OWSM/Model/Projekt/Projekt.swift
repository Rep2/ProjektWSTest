//
//  Projekt.swift
//  Appbook
//
//  Created by IN2 MacbookPro on 21/12/15.
//  Copyright © 2015 iOS pro team. All rights reserved.
//

import Foundation

struct Projekt{
    
    let id:String
    let voditelj:String
    let naziv:String
    
    let lobovi:[Lob]
    let taksovi:[Task]
    
    static func arrayFromJSON(data:[[String:AnyObject]]) -> ([Projekt], [Lob]?){
        
        var arrayProjekti = [Projekt]()
        var arrayLobovi: [Lob]?
        
        for entity in data{
            
            // Checks for svi lobovi
            if let lobovi = entity["svi_lobovi"] as? [[String:AnyObject]]{
                arrayLobovi = Lob.arrayFromSviLobovi(lobovi)
            }else{
                arrayProjekti.append(Projekt(id: entity["id"] as? String ?? "-1",
                    voditelj: entity["voditelj"] as? String ?? "",
                    naziv: entity["naziv"] as? String ?? "",
                    lobovi: Lob.arrayFromJSON(entity["lobovi"] as? [[String:AnyObject]] ?? []),
                    taksovi: Task.arrayFromJSON(entity["taskovi"] as? [[String:AnyObject]] ?? [])))
            }
        }
        
        return (arrayProjekti, arrayLobovi)
    }
    
}