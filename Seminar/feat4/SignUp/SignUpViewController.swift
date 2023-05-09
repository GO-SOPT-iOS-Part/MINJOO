//
//  SignUpViewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/06.
//

import UIKit

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUp()
    }
    
    private func signUp() {
        SignUpService.shared.signUp(email: "hello@gmail.com", nickname: "hahaha", password: "password11!") {
            response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
