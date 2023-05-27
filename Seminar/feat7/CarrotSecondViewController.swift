//
//  CarrotSecondViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/27.
//

import UIKit
import RealmSwift

class CarrotSecondViewController: UIViewController {
    let localRealm = try! Realm()
    
    let dummy = CarrotViewController().dummy
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dummy.forEach {
//            if $0.star == true {
//                let id = $0.id
//                let task = Carrot(id: $0.id, image: $0.image, product: $0.product, place: $0.place, time: $0.time, tradeStatus: $0.tradeStatus, price: $0.price, star: $0.star)
//                try! localRealm.write {
//                    localRealm.add($0)
//                }
//            }
//        }
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
    }
}
