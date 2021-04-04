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
            realm.add(object)
            print("Added new object")
        }
    }
        func updateAddOneDay(object: ObjectWeatherDay) {  // перзапись в БД на один день
            try! realm.write {
                realm.add(object, update: .all)
                print("Update object")
            }
        }
    
    func getDataFromDB() -> Results<ObjectWS> {
        let results: Results<ObjectWS> = realm.objects(ObjectWS.self)
        return results
    }
        
    func addData(object: [ObjectWeatherSeveralDay]) {
        try! realm.write {
            realm.add(object)
            print("Added new object")
        }
    }
    
    func updateAddData(object: [ObjectWeatherSeveralDay]) {
        try! realm.write {
            realm.add(object)
            print("Update object")
        }
    }

    
    
    
}
