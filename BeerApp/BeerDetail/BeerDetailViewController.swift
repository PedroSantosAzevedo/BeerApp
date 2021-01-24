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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = BeerDetailView()
        detailView.setUp(beer: beer)
        setTitle()
        
        
    }
    
    private func setTitle(){
        self.navigationItem.title = beer.name
    }
    
    
}
