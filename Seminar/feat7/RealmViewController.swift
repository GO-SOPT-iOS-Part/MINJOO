//
//  RealmViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/27.
//

import UIKit
import RealmSwift

final class RealmViewController: UIViewController {
    
    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = User(id: 100, name: "승찬", age: 27, phoneNumber: 01012345678)
        
        try! localRealm.write {
            localRealm.add(task1)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
