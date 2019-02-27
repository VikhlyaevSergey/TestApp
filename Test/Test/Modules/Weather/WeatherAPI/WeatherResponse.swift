//
// WeatherResponse.swift
//  Mimoza
//
//  Created by Сергей Вихляев on 15/10/2018.
//  Copyright © 2018 Сергей Вихляев. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {

    struct Coord: Codable {
        struct Main: Codable {
            var temp: Double = 0.0
            var tempMin: Double = 0.0
            var tempMax: Double = 0.0
        }

        var main: Main?
    }

    var coord: Coord?
}

struct WeatherError: Codable {}
