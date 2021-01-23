//
//  APIConfiguration.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
