//
//  Photo.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/22.
//

import UIKit

struct Photo {
    let image: UIImage
    var heartTapped: Bool
}

extension Photo {
    static func dummy() -> [Photo] {
        var photos: [Photo] = []
        for photo in 1...12 {
            photos.append(Photo(image: UIImage(named: "photo_\(photo)")!,
                                heartTapped: false))
        }
        return photos + photos
    }
}
