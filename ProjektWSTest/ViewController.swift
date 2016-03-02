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
        
        table.refreshControllUpdateFunction = {
            [unowned self] in
            self.getData(true)
        }
        
        getData(false)
    }
    
    func getData(refresh: Bool = true){
        if let data = ProjektResrouce.instance.getProjekti(
            refresh,
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

