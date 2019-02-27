//
//  WeatherApi.swift
//  Mimoza
//
//  Created by Сергей Вихляев on 15/10/2018.
//  Copyright © 2018 Сергей Вихляев. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON
import PromiseKit
import UIKit

class WeatherApi {
    func getWeatherForCity(with id: Int)->Promise<DefaultResponse<WeatherResponse, WeatherError>>{
        NetworkActivityIndicatorManager.networkOperationStarted()
        return Promise{ seal in
            NetworkActivityIndicatorManager.networkOperationFinished()
            Alamofire.request(WeatherRequest.getWeatherForCity(id: id))
                .response(completionHandler: { (response) in
                    debugPrint(response)
                    if let error = response.error {
                        seal.reject(error)
                    } else {
                        if let data = response.data  {
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                let contactsResponse = try decoder.decode(DefaultResponse<WeatherResponse, WeatherError>.self, from: data)
                                print(contactsResponse.success)
                                seal.fulfill(contactsResponse)
                            } catch {
                                let error = NSError(domain: "Parsing error", code: -1002, userInfo: nil)
                                seal.reject(error)
                                print(error)
                            }
                        } else {
                            print("error no data")
                            let error = NSError(domain: "Empty response", code: -1003, userInfo: nil)
                            seal.reject(error)
                        }
                    }
                })
                .responseJSON(completionHandler: { (response) in
                    switch response.result{
                    case .success(let value):
                        print(JSON(value))
                    case .failure(let error):
                        print(error)
                    }
                })
        }
    }
}
