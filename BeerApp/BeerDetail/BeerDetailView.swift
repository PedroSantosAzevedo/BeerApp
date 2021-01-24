//
//  BeerDetailView.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit

class BeerDetailView:UIView{
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .purple
        
    }
    override func layoutSubviews() {
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setConstraints(){
        
    }
    
    
}

