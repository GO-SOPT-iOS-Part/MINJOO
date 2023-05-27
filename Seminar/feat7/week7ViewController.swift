//
//  week7ViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/27.
//

import UIKit

import RealmSwift

class User: Object {
    
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var age: Int = 0
    @Persisted var phoneNumber: Int = 0
    
    convenience init(id: Int, name: String, age: Int, phoneNumber: Int) {
        self.init()
        self.id = id
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
    }
}

class week7ViewController: UIViewController {

}
