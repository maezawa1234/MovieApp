//
//  MovieRequestType.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import APIKit
import SwiftyJSON

protocol MovieRequestType: Request {}

extension MovieRequestType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
}

extension MovieRequestType where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        print(#function)
        print(data)
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(Response.self, from: data)
        } catch {
            print(error)
            throw error
        }
    }

    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        print("生データ表示")
        print(object)
        let statusCode = urlResponse.statusCode
        guard case (200 ..< 300) = statusCode else {
            let json = JSON(object)
            guard let message = json["message"].string else {
                throw ResponseError.unexpectedObject(object)
            }
            throw APIError(message: message, responseObject: object)
        }
        return object
    }
}


