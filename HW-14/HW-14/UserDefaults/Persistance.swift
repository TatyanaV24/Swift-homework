//
//  Persistance.swift
//  HW-14
//
//  Created by Татьяна Васильченко on 22.03.2021.
//

import Foundation

class Persistance {
    static let shared = Persistance()
    
    private let kUserNameKey = "Persistance.kUserNameKey"
    private let kUserSurnameKey = "Persistance.kUserSurnameKey"
    var userName: String? {
        set {
            if let name = newValue {
                UserDefaults.standard.set(name, forKey: kUserNameKey)
            } else {
                UserDefaults.standard.removeObject(forKey: kUserNameKey)
            }
        }
        get { return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    var userSurname: String? {
        set {
            if let surname = newValue {
                UserDefaults.standard.set(surname, forKey: kUserSurnameKey)
            } else {
                UserDefaults.standard.removeObject(forKey: kUserSurnameKey)
            }
        }
        get { return UserDefaults.standard.string(forKey: kUserSurnameKey)}
    }
}
