//
//  Carrot.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/22.
//

import UIKit

struct Carrot {
    let image: UIImage
    let product: String
    let place: String
    let time: String
    let tradeStatus: Trade
    let price: Int
    let star: Bool
}

extension Carrot {
    
    static func dummy() -> [Carrot] {
        return [Carrot(image: Image.hypeBoy,
                       product: "에어팟 프로 2",
                       place: "하계 2동",
                       time: "일주일 전",
                       tradeStatus: .completed,
                       price: 200000,
                       star: false),
                Carrot(image: Image.hypeBoy,
                       product:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "4월 2일",
                       tradeStatus: .reservation,
                       price: 100000,
                       star: false),
                Carrot(image: Image.hypeBoy,
                       product:
                        "아이폰 5",
                       place: "공릉 2동",
                       time: "1일 전",
                       tradeStatus: .shared,
                       price: 100000,
                       star: false),
                Carrot(image: Image.hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "6시간 전",
                       tradeStatus: .completed,
                       price: 100000,
                       star: false),
                Carrot(image: Image.hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3시간 전",
                       tradeStatus: .clear,
                       price: 100000,
                       star: false)
                ,
                Carrot(image: Image.hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "4월 3일",
                       tradeStatus: .completed,
                       price: 100000,
                       star: false)
                ,
                Carrot(image: Image.hypeBoy,
                       product:
                        "아이폰 5",
                       place: "중계 2동",
                       time: "3월 31일",
                       tradeStatus: .reservation,
                       price: 1000,
                       star: false)]
    }
}
