//
//  APIError.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation
import APIKit
import SwiftyJSON

struct APIError: Error {
    let message: String
    let responseObject: Any?
    var responseJSON: JSON? {
        guard let object = responseObject else { return nil }
        return JSON(object)
    }
    
    init(error: Error) {
        if let error = error as? APIError {
            self.message = error.message
            self.responseObject = error.responseObject
        } else if let error = error as? SessionTaskError {
            switch error {
            case .responseError(let responseError as APIError):
                self.message = responseError.message
                self.responseObject = responseError.responseObject
            default:
                self.message = "Other SessionTaskError"
                self.responseObject = nil
            }
        } else {
            self.message = ""
            self.responseObject = nil
        }
    }
    
    init(message: String, responseObject: Any?) {
        self.message = message
        self.responseObject = responseObject
    }
}
