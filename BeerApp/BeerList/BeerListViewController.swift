//
//  BeerListViewController.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import UIKit

class BeerListViewController: UIViewController {
    
//MARK:- Controller Variables
    var listView:BeerListView {return self.view as! BeerListView}
    var viewModel:BeerListViewModel!
    
//MARK:- Init
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = BeerListView()
        self.viewModel = BeerListViewModel()
        setBindings()
    }
    
    
    private func setBindings(){
        viewModel.beerStatus.bind { (status) in
            self.setView(with:status)
        }
    }
    
    
}
//MARK:- ViewStatus
extension BeerListViewController{
    private func setView(with status:ViewStatus){
        switch status{
        case .loading:
            debugPrint("loading")
        case .loaded:
            debugPrint("loaded")
        case .error(let errorString):
            debugPrint("error: " + errorString )
        default:
            debugPrint("[BeerListViewController]:No view Status")
        }
        
    }
    
}
