//
//  BeerDetailViewController.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit

class BeerDetailViewController:UIViewController{
    
    var beer:Beer!
    
    var detailView:BeerDetailView {return self.view as! BeerDetailView}
//    var viewModel:BeerListViewModel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = BeerDetailView()
//        self.viewModel = BeerListViewModel()
     
        
    }
    
    
    
}
