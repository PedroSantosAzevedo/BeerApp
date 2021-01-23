//
//  Beer.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation


class Beer:Codable{
   
    let image:String
    let name:String
    let alcoholPercentage:Double
    let tagline:String
    let bitterness:Double
    let description:String
    
    
    enum CodingKeys:String,CodingKey{
        
        case image = "image_url"
        case name
        case alcoholPercentage = "abv"
        case tagline
        case bitterness = "ibu"
        case description
        
        
    }
    
    
    
    
    
}
