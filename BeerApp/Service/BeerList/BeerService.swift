//
//  BeerService.swift
//  BeerApp
//
//  Created by Pedro Azevedo on 23/01/21.
//

import Foundation


import Alamofire

class BeerService {
    
    @discardableResult
    private static func performRequest(route: APIConfiguration, completion: @escaping (DataResponse<Any, AFError>?) -> Void) -> DataRequest {
        return AF.request(route).validate().responseJSON { (response: DataResponse<Any, AFError>?) in
            
            completion(response)
        }
    }
    
    
    
    static func getBeers(page: Int, success: @escaping ( [Beer])->Void,
                         failure: @escaping (String)->Void) {
        performRequest(route: BeerListEndpoint(pagination: page)) { response in
            if response?.error == nil {
                if let data = response?.data, let utf8Text = String(data: data, encoding: .utf8) {
                    
                    guard let jsonData = utf8Text.data(using: .utf8) else {
                        failure(response?.error?.errorDescription ?? "Decode Error")
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let beers = try decoder.decode([Beer].self, from: jsonData)
                        
                        
                       success(beers)
                    } catch {
                        
                        failure(response?.error?.errorDescription ?? "Decode error")
                    }
                }else{
                    failure(response?.error?.errorDescription ?? "Decode error")
                }
            } else {
                failure(response?.error?.errorDescription ?? "Request error")
            }
        }
    }
    
 
    
    
    
}
