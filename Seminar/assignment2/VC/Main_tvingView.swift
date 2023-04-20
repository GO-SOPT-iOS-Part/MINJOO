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
    
    private lazy var backButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "btn_before"), for: .normal)
        $0.addTarget(self,
                     action: #selector(goToAuthView),
                     for: .touchUpInside)
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
        view.addSubviews(backButton, label)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(77)
            $0.leading.equalTo(10)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        label.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    @objc
    func goToAuthView() {
        let authViewController = Auth_tvingView()
        self.navigationController?.pushViewController(authViewController, animated: true)
    }
    
}
