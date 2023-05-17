//
//  FirstViewController_DelegatePattern.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/08.
//

import UIKit
import SnapKit
import Then

final class FirstViewController_DelegatePattern: BaseViewController2 {
    
    private let originView = CommonView2()
    
    override func loadView() {
        self.view = originView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
}

private extension FirstViewController_DelegatePattern {
    
    func target() {
        originView.backButton.addTarget(self, action: #selector(pushToSecondViewController), for: .touchUpInside)
    }
    
    @objc
    private func pushToSecondViewController() {
        
        let secondViewController = SecondViewController_DelegatePattern()
        
        secondViewController.completionHandler = { [weak self] text in
            
            guard let self else { return }
            
            originView.nameLabel.text = text
            if text == "" {
                originView.nameLabel.text = "이름이 무엇인가요!?"
            }
            
        }
        
        
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

