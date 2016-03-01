//
//  ViewController.swift
//  ProjektWSTest
//
//  Created by Rep on 3/1/16.
//  Copyright © 2016 Rep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: IRTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = ProjektResrouce.instance.getAll(
            observer: { (data, error) -> Void in
                self.presentData(data, error: error)
            })
        {
            self.presentData(data)
        }
        
    }
    
    func presentData(data: [Projekt]?, error: HTTPRequestError? = nil){
        var cells = [IRCellViewModel]()
        
        if let data = data{
            for projekt in data{
                cells.append(IRCellViewModel(
                    implementationIdentifier: IRCellIdentifier.OneLabelBasic,
                    data: [IRCellElementIdentifiers.FirstLabel : projekt.naziv]))
            }
        }
        
        table.setData([IRCellViewModelSection(sectionTitle: nil, cellViewModels: cells)])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

