//
//  BeerListViewController.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import UIKit

class BeerListViewController: UIViewController {
    
    var listView:BeerListView {return self.view as! BeerListView}
    var viewModel:BeerListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = BeerListView()
        // Do any additional setup after loading the view.
        self.viewModel = BeerListViewModel()
    }


}

