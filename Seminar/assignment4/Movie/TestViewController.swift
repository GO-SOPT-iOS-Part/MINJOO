//
//  TestViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/09.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        test()
    }

    func test () {
        MovieService.shared.getNowPlaying() { response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieResponse else { return }
                dump(data)
            default: return
            }
        }
    }
}
