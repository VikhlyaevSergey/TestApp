//
//  WeatherPresenter.swift
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

protocol WeatherPresentationLogic {
    func getCurrentWeatherForCity(with id: Int)
}

class WeatherPresenter: WeatherPresentationLogic {

    var viewController: WeatherDisplayLogic?
    var interactor: WeatherBusinessLogic?

    func getCurrentWeatherForCity(with id: Int) {
        interactor?.getWeatherForCity(with: id, completion: { (success, weather, message, error) in
            if success {
                
            } else {
                if message != nil {

                } else if error != nil {

                } else {
                    fatalError("message & error is empty")
                }
            }
        })
    }
}
