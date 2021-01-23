//
//  UIView+Extensions.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import UIKit


extension UIView{
    
    func roundCorner(radius:CGFloat){
        self.layer.cornerRadius = radius
    }
    
    func borderWithColor( _ color :UIColor,width:CGFloat){
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    
}
