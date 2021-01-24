//
//  BeerListEndpoint.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation
import Alamofire

class BeerListEndpoint:APIConfiguration{
    
    
    var method: HTTPMethod = .get
    
    var path: String
    
    var parameters: Parameters? = nil
    
    init(pagination:Int){
        self.path = "beers?page=\(pagination)&per_page=15"
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        let url = NetworkInfo.ProductionServer.baseURL + path
        
        var urlRequest = URLRequest(url: URL(string: url)!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
      
}
