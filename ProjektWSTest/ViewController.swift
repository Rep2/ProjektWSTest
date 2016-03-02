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
                    data: [IRCellElementIdentifiers.FirstLabel : projekt.naziv],
                    didSelectCellFunc: {
                        var loboviCells = [IRCellViewModel]()
                        
                        for lob in projekt.lobovi{
                            loboviCells.append(IRCellViewModel(
                                implementationIdentifier: IRCellIdentifier.OneLabelBasic,
                                data: [IRCellElementIdentifiers.FirstLabel : lob.naziv]))
                        }
                        
                        let controller = GenericsWireframe().getTableViewController()
                        controller.setSections([IRCellViewModelSection(sectionTitle: nil, cellViewModels: loboviCells),IRCellViewModelSection(sectionTitle: nil, cellViewModels: loboviCells)])
                        
                        Wireframe.instance.pushViewController(controller)
                }))
            }
        }
        
        table.setData([IRCellViewModelSection(sectionTitle: nil, cellViewModels: cells)])
        
    }

    func pushLob(lobovi: [Lob]){
        
    }


}

