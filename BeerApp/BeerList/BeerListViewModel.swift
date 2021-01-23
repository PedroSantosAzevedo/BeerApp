//
//  BeerListViewModel.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation

class BeerListViewModel{
    
    var beers:[Beer] = []
    
    init() {
        getBeerList()
    }
    
    
    func getBeerList(){
        BeerService.getBeers(page: 0) { (beerList) in
            self.beers.append(contentsOf: beerList)
        } failure: { (errorString) in
            
            debugPrint(errorString ?? "")
        }

    }
    
}
