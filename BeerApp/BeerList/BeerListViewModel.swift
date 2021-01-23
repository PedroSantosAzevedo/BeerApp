//
//  BeerListViewModel.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation

class BeerListViewModel{
    
    var beers:[Beer] = []
    var pagination:Int = 1
    var beerStatus:Box<ViewStatus> = Box(.none)
    var isLoadingMoreBeer = false
    
    init() {
        getBeerList()
    }
    
    
    func getBeerList(){
        
        
        guard !isLoadingMoreBeer else {return}
        self.isLoadingMoreBeer = true
        
        self.beerStatus.value = self.beers.count == 0 ? .loading : .loadingMore
        BeerService.getBeers(page: pagination) { (beerList) in
            
            self.beers.append(contentsOf: beerList)
            self.isLoadingMoreBeer = false
            self.pagination += 1
            self.beerStatus.value = beerList.count == 0 ? .noResults : .loaded
            
            
            
        } failure: { (errorString) in
            
            self.beerStatus.value = .error(errorString ?? "Error")
            self.isLoadingMoreBeer = false
            
        }
        
    }
    
}
