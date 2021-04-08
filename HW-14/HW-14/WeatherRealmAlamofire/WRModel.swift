//
//  WRModel.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 03.04.2021.
//

import Foundation
import UIKit
import RealmSwift

class ObjectWeatherDay: Object {
    
    @objc dynamic var cityName = ""
    @objc dynamic var temperature = 0
    @objc dynamic var feelsLike = 0
    @objc dynamic var pressureDay = 0
    @objc dynamic var humidityDay = 0
    @objc dynamic var id = 1

    override class func primaryKey() -> String {
            return "id"
        }
}

class ObjectWeatherSeveralDay: Object {
    @objc dynamic var day = 0
    @objc dynamic var averTemp = 0
    @objc dynamic var minTemp = 0
    @objc dynamic var maxTemp = 0
    
}

class ObjectWS: Object {
    @objc dynamic var id = 1
    let weather = List<ObjectWeatherSeveralDay>()
    
    override class func primaryKey() -> String {
        return "id"
    }
}
