//
//  APIError.swift
//  IhubMQTTChat
//
//  Created by ihub on 15/02/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

import Foundation
import Alamofire
import Firebase
struct APIError{
    func apiErrorHandling(apierror:Error) -> String {
        var errMsg = ""
        if let error = apierror as? AFError{
            switch error {
            case .invalidURL(let url):
                errMsg = "Invalid URL: \(url) - \(error.localizedDescription)"
                //print("Invalid URL: \(url) - \(error.localizedDescription)")
            case .parameterEncodingFailed(let reason):
                errMsg = "Parameter encoding failed: \(error.localizedDescription), Reason:\(reason)"
                //print("Parameter encoding failed: \(error.localizedDescription)")
                //print("Failure Reason: \(reason)")
            case .multipartEncodingFailed(let reason):
                errMsg = "Multipart encoding failed: \(error.localizedDescription), Reason:\(reason)"
                //print("Multipart encoding failed: \(error.localizedDescription)")
                //print("Failure Reason: \(reason)")
            case .responseValidationFailed(let reason):
                errMsg = "Response validation failed: \(error.localizedDescription), Reason:\(reason)"
                //print("Response validation failed: \(error.localizedDescription)")
                //print("Failure Reason: \(reason)")
                
                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                     errMsg = "Downloaded file could not be read: \(error.localizedDescription), Reason:\(reason)"
                    //print("Downloaded file could not be read")
                case .missingContentType(let acceptableContentTypes):
                    errMsg = "Content Type Missing: \(error.localizedDescription), acceptableContentTypes:\(acceptableContentTypes)"
                    //print("Content Type Missing: \(acceptableContentTypes)")
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    errMsg = "Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)"
                    //print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                case .unacceptableStatusCode(let code):
                    errMsg = "Response status code was unacceptable: \(code)"
                    //print("Response status code was unacceptable: \(code)")
                }
            case .responseSerializationFailed(let reason):
               
                errMsg = "Response serialization failed: \(error.localizedDescription), Reason:\(reason)"
                //print("Response serialization failed: \(error.localizedDescription)")
                //print("Failure Reason: \(reason)")
            }
           // errMsg = "Response serialization failed: \(error.localizedDescription), Reason:\(reason)"
            //print("Underlying error: \(String(describing: error.underlyingError))")
}
        else if let urlerror = apierror as? URLError {
            errMsg = "URLError occurred: \(urlerror)"
            //print("URLError occurred: \(urlerror)")
        } else {
            errMsg = "UnKnown Error"
            //print("Unknown error: \(apierror)")
        }
        
        return errMsg
    }
}

struct FirebaseApiError {
    static func authErrors(error:AnyObject) -> String{
        if let errorCode = AuthErrorCode(rawValue:error.code){
            switch errorCode{
            case .invalidEmail:
                print("Invalid email id")
                return "Invalid email id"
            case .emailAlreadyInUse:
                print("Email already in use")
                return "Email already in use"
            default:
                print("error default")
                return "Unknown Error"
            }
        }else{
            return ""
        }
    }
}
