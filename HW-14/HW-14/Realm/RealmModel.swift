//
//  RealmModel.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 02.04.2021.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var isCompleted = false
}
