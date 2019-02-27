//
//  WeatherInteractor.swift
//  Test
//
//  Created by Сергей Вихляев on 25/02/2019.
//  Copyright (c) 2019 Сергей Вихляев. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WeatherBusinessLogic {
    func getWeatherForCity(with id: Int, completion: @escaping (Bool, WeatherResponse.Main?, String?, Error?) -> ())
}

class WeatherInteractor: WeatherBusinessLogic {
    func getWeatherForCity(with id: Int, completion: @escaping (Bool, WeatherResponse.Main?, String?, Error?) -> ()) {
        WeatherApi().getWeatherForCity(with: id).done { (response) in
            if response.main != nil {
            //if response.success {
                completion(true, response.main, nil, nil)
            } else {

            }
            }.catch { (error) in
                completion(false, nil, nil, error)
        }
    }
}
