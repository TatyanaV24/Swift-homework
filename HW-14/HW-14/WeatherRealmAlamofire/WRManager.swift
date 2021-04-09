//
//  WRManager.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 03.04.2021.
//

import UIKit
import RealmSwift

class WRManager {
    
    private var realm = try! Realm()
    static let sharedInstance = WRManager()
    
    func getDataFromDBOneDay() -> Results<ObjectWeatherDay> { // получение базы данных на один день
        let results: Results<ObjectWeatherDay> = realm.objects(ObjectWeatherDay.self)
        return results
    }
    func addDataOneDay(object: ObjectWeatherDay) { // запись в БД на один день
        try! realm.write {
            realm.add(object, update: .all)
            print("Added new object")
        }
    }
    func addDataArray(data: [FeatherData]) {
        var uniqueDates: [String] = []
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy"
        let weather = ObjectWeatherSeveralDay()
        for item in data {
            let formattedDate = dateFormat.string(from: Date(timeIntervalSince1970: TimeInterval(item.dt)))
            if !uniqueDates.contains(formattedDate) {
                uniqueDates.append(formattedDate)
            weather.averTemp = Int(item.main.temp)
            weather.day = item.dt
            weather.maxTemp = Int(item.main.temp_max)
            weather.minTemp = Int(item.main.temp_min)
            }
            addData7days(object: weather)
        }
    }
    
    func addData7days(object: ObjectWeatherSeveralDay) {
        try! realm.write {
            realm.add(object, update: .all)
            print("Added new next object")
        }
    }
    
    func getDataFromDB() ->  Results<ObjectWS> {
        let results:  Results<ObjectWS> = realm.objects(ObjectWS.self)
        return results
    }
}
