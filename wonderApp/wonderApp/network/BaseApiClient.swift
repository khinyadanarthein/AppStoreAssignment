//
//  BaseApiClient.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 13/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import Alamofire

class BaseApiClient {
    
    static let BASE_URL = "https://api.myjson.com/"
    
    func requestApi(
        url: String,
        method: HTTPMethod,
        params: Parameters,
        encoding: ParameterEncoding = URLEncoding.default,
        success: @escaping(Data) -> Void,
        fail: @escaping(String) -> Void
    ){
        Alamofire.request(BaseApiClient.BASE_URL + url, method: method, parameters: params, encoding: encoding).responseJSON { (response) in
            
            switch response.result {
            case .success:
                success(response.data!)
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
                
                fail(error.localizedDescription)
            }
        }
    }
}
