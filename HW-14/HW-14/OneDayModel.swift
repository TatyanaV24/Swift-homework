//
//  OneDayModel.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 24.03.2021.
//

import Foundation

struct Weather: Codable{
    var id:Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Double = 0.0
    var feels_like: Double = 0.0
    var temp_min: Double = 0.0
    var temp_max: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct WeatherData: Codable {
    var weather:[Weather] = []
    var main: Main = Main()
    var name: String = ""
    }