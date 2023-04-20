//
//  Main_tvingView.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/11.
//

import UIKit
import SnapKit
import Then


final class Main_tvingView: UIViewController {
    
    private let label = UILabel().then {
        let label = UILabel()
        $0.text = "Main Page"
        $0.font = .tvingBold(ofSize: 23)
        $0.textColor = .tvingWhite
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        setLayout()
    }
    
}

private extension Main_tvingView {
    
    func style() {
        view.backgroundColor = .tvingBlack
    }
    func setLayout() {
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        
    }
}
