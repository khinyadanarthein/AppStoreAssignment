//
//  ApiClient.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 13/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient: BaseApiClient {
    
    static let shared: ApiClient = ApiClient()
    
    private override init() {}
}

extension ApiClient : Api {
    func getAllWonderList(success: @escaping (WonderResponse) -> Void, fail: @escaping (String) -> Void) {
        
        let params: Parameters = [
            PARAM_Q:"apple",
            PARAM_SORT_BY:ORDER_BY
        ]
        self.requestApi(url: API_ALL_WONDERS, method: .get, params: params, encoding: URLEncoding(destination: .queryString), success: { (response) in
            
            let data = try! JSONDecoder().decode(WonderResponse.self, from: response)
            
            success(data)
            
        }) { (error) in
            print(error)
        }
        
    }
    
    
}
