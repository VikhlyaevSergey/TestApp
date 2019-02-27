//
//  DefaultResponse.swift
//  SmartBabyWatch
//
//  Created by Сергей Ирбеткин on 08.09.2018.
//  Copyright © 2018 innova. All rights reserved.
//

import Foundation

// Для корректной работы пришлось не использовать нормальную структуру запроса
struct DefaultResponse<Response: Codable, ResponseError: Codable>: Codable {

    var success: Bool
    var error: Int?
    var message: String?
    var response: Response
}
