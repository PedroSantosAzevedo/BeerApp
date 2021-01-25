//
//  Theme.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 25/01/21.
//

import Foundation
import UIKit


//MARK:- Fonts
enum Fonts:String{
    case Bohemian = "Bohemian Typewriter"
    case Default = ""
}

enum FontSize:CGFloat{
    case Title = 25
    case Default = 17
}

//MARK:- Color
enum Colors{
    case Yellow
   
}

class Theme{
    
    
    static func getFont(font:Fonts, size:FontSize) -> UIFont{
        
        let font = UIFont(name: font.rawValue, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
        return font
        
        
    }
    
    static func getColot(color:Colors) -> UIColor{
        
        switch color{
        case .Yellow:
            return UIColor.init(displayP3Red: 214/255, green: 179/255, blue: 107/255, alpha: 1)
        }
        
    }
    
    
    
}
