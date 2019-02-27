//
//  WeatherRequest.swift
//  Mimoza
//
//  Created by Сергей Вихляев on 15/10/2018.
//  Copyright © 2018 Сергей Вихляев. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

enum WeatherRequest: URLRequestConvertible{

    case getWeatherForCity(id: Int)

    var path: String {
    switch self {
    case .getWeatherForCity:
        return "http://api.openweathermap.org/data/2.5/weather"
        }
    }

    var method: HTTPMethod{
        switch self {
        case .getWeatherForCity:
            return .get
        }
    }

    var headers: HTTPHeaders {
        let headers: [String: Any] = [:]
        return headers as! HTTPHeaders
    }

    var parameters: [String: Any]? {
        switch self {
        case .getWeatherForCity(let id):
            let parameters: [String: Any] = [
                "appid": "9f5eb837bd4d6da0878535f13c201f7e",//484638
                "lat": 52.43,
                "lon": 41.27,
                "mode": "json"
            ]
            return parameters
        }
    }

    func asURLRequest() throws -> URLRequest {

        let url = try path.asURL()// not good, need new idea for this
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        switch method {
        case .get:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .post:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .put:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .delete:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        return urlRequest
    }
}
