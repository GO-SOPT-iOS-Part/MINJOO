//
//  Welcome_tvingView.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/10.
//

import UIKit
import SnapKit
import Then

final class Welcome_tvingView: UIViewController {
    
    public var text: String?
    
    private let tvingImage = UIImageView().then {
        $0.image = UIImage(named: "image.png")
    }
    
    private lazy var myLabel = UILabel().then {
        $0.font = .tvingBold(ofSize: 23)
        $0.textColor = .white
    }
    
    private lazy var mainButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.backgroundColor = .tvingRed
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.makeCornerRound(radius: 3)
        $0.addTarget(self,
                     action: #selector(goToMainVC),
                     for: .touchUpInside)
    }
    
    func label() {
        myLabel.text = text! + " 님\n반가워요!"
        myLabel.numberOfLines = 2
        myLabel.textAlignment = .center
        myLabel.setLineSpacing(spacing: 1.33)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label()
        style()
        setLayout()
    }
}

private extension Welcome_tvingView {
    
    func style() {
        view.backgroundColor = .black
    }
    
    func setLayout() {
        
        view.addSubviews(tvingImage, myLabel, mainButton)
        
        tvingImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(58)
            $0.height.equalTo(210.94)
            $0.leading.trailing.equalToSuperview()
        }
        
        myLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(336)
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc
    func goToMainVC() {
        let mainViewController = Main_tvingView()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}
