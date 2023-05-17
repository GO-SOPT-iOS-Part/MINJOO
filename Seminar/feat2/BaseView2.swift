//
//  BaseView.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/22.
//

import UIKit

class BaseView2: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {}
    func setLayout() {}
}
