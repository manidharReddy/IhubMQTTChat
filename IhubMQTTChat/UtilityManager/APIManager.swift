//
//  APIManager.swift
//  MaterialDesignPractice
//
//  Created by ihub on 01/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper
class APIManager{
    static let baseUrl = APICONSTANTS.basicUrl
    static let shared = APIManager()
    
    /*
     - Parameters:
     - url: API login url
     - body: Request parameters
     - Completion:
     - Any: login response value in json
     - error: login response error handling
     */
    class func requestJson(url:String,body:Parameters,completionHandler:@escaping (Any?, String?) -> Void){
        print("URL:\(url)")
        print("body:\(body)")
       // Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).responseObject{(response: DataResponse<IHUBUrlResponse>) in
        Alamofire.request(url, method: .post, parameters: body,encoding:JSONEncoding.default).validate().responseJSON { response in
            debugPrint(response)
           
            
            
            
        switch response.result {
        case .success:
            completionHandler(response.result.value, nil)
        case .failure(let error):
            let apierr = APIError()
           let errMsg = apierr.apiErrorHandling(apierror: error)
            completionHandler(response.result.value, errMsg)
        }
            
      }
   }
}
