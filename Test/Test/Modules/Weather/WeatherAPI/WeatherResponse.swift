//
// WeatherResponse.swift
//  Mimoza
//
//  Created by Сергей Вихляев on 15/10/2018.
//  Copyright © 2018 Сергей Вихляев. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {

    struct Main: Codable {

        var temp: Double = 0.0
        var tempMin: Double = 0.0
        var tempMax: Double = 0.0
    }

    var main: Main?
}

// Все хорошее, что можно было применить в АПИ, тут отсутствует
//struct WeatherError: Codable {}
