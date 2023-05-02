//
//  viewController.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/24.
//


import UIKit
import SnapKit
import Then


final class MainPage_ViewController: UIViewController {
    
    private lazy var tvingLogo = UIImageView().then {
        $0.image = UIImage(named: "tving_logo")
    }
    
    private lazy var profileButton = UIButton().then {
        $0.setImage(UIImage(named: "profileImage"), for: .normal)
        $0.addTarget(self, action: #selector(goToProfile),
                     for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        style()
        setLayout()
    }
}

private extension MainPage_ViewController {
    
    func style() {
        view.backgroundColor = .tvingBlack
    }
    func setLayout() {
        view.addSubviews(tvingLogo, profileButton)

        tvingLogo.snp.makeConstraints {
            $0.top.equalTo(58)
            $0.leading.equalTo(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        
        profileButton.snp.makeConstraints {
            $0.centerY.equalTo(tvingLogo)
            $0.trailing.equalToSuperview().offset(-9)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }
    @objc
    func goToProfile() {
        let MyPageViewController = MyPage_ViewController()
        self.navigationController?.pushViewController(MyPageViewController, animated: false)
    }
    
}
