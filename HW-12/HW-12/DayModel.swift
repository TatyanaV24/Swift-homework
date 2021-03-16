//
//  DayModel.swift
//  HW-12
//
//  Created by Татьяна Васильченко on 12.03.2021.
//

import Foundation

struct Feather: Codable{
    var id:Int
    var main: String
    var description: String
    var icon: String
}

struct Nain: Codable {
    var temp: Double = 0.0
    var feels_like: Double = 0.0
    var temp_min: Double = 0.0
    var temp_max: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct FeatherData: Codable {
    var dt:Int = 0
    var weather:[Feather] = []
    var main: Nain = Nain()
    var dt_txt: String = ""
}

struct ListW: Codable{
    var list:[FeatherData] = []
}
