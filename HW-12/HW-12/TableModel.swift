//
//  TableModel.swift
//  HW-12
//
//  Created by Татьяна Васильченко on 10.03.2021.
//

import Foundation

struct Nain: Codable {
    var temp: Double = 0.0
    var feelsLike: Double = 0.0
    var tempMin: Double = 0.0
    var tempMax: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct Feather: Codable{
    var id:Int
    var main: String
    var description: String
    var icon: String
}

struct List {
    var weather:[Feather] = []
    var main: Nain = Nain()
    var dtTxt: String = ""
}
