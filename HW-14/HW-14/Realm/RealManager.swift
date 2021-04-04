//
//  RealmList.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 02.04.2021.
//

import UIKit
import RealmSwift

class RealManager {
    
    private var realm = try! Realm()
    static let sharedInstance = RealManager()
    
    func getDataFromDB() -> Results<Task> {
        let results: Results<Task> = realm.objects(Task.self)
        return results
    }
    
    func addData(object: Task) {
        try! realm.write {
            realm.add(object)
            print("Added new object")
        }
    }
    
    func changeChekmark(object: Task){
        try! realm.write{
            object.isCompleted = !object.isCompleted
        }
    }
    
    func deleteFromDb(object: Task) {
        try! realm.write {
            realm.delete(object)
        }
    }
}
