//
//  MyTableViewHeader.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/01.
//

import UIKit
import SnapKit
import Then

class MyTableViewHeader: BaseTableViewHeaderFooterView<Void> {
    
    private lazy var profileContainer = UIView()
    
    private lazy var mySubscribeContainer = UIView().then {
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 3
        
    }
    
    private lazy var subscribe = UIView().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 3
        
    }
    private lazy var mySubscribe = UIView()
    
    private lazy var tvingCash = UIView()
    
    private lazy var profileImage = UIImageView ().then {
        $0.image = UIImage(named: "profileImage")
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .gray180
        
    }
    private let nameLabel = UIButton().then {
        $0.setTitle("공듀", for: .normal)
        $0.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 20)
        $0.titleLabel?.sizeToFit()
        $0.titleLabel?.textColor = .tvingWhite
    }
    lazy var editProfileButton = UIButton().then {
        $0.setImage(UIImage(named: "editProfile"), for: .normal)
    }
    
    lazy var switchProfileButton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)
        $0.titleLabel?.textColor = .tvingWhite
        $0.layer.borderColor = UIColor.gray180.cgColor
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
    }
    
    
    private let myTicketsIcon = UIImageView().then {
        $0.image = UIImage(named: "MyPage_mytickets")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = UIColor.gray370
    }
    
    private let tvingCashIcon = UIImageView().then {
        $0.image = UIImage(named: "MyPage_tvingCash")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = UIColor.gray370
    }
    
    private let myTicketsLabel = UILabel().then {
        $0.text = "나의 이용권"
        $0.font = UIFont(name: "Pretendard-Semibold", size: 13)
        $0.textColor = .gray560
    }
    
    private let tvingCashLabel = UILabel().then {
        $0.text = "티빙캐시"
        
        $0.font = UIFont(name: "Pretendard-Semibold", size: 13)
        $0.textColor = .gray560
    }
    
    private lazy var usingTickets = UIButton().then {
        $0.setTitle("사용중인 이용권이 없습니다.", for: .normal)
        
        $0.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 13)
        $0.titleLabel?.textColor = .gray384
    }
    
    private lazy var myTvingCash = UILabel().then {
        $0.text = "0"
        
        $0.textColor = .tvingWhite
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
    }
    
    override func configure() {
        super.configure()
        
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(profileContainer)
        
        addSubview(mySubscribeContainer)
        
        addSubview(subscribe)
        
        
        profileContainer.addSubview(profileImage)
        
        
        profileContainer.addSubviews(nameLabel, switchProfileButton, editProfileButton)
        mySubscribeContainer.addSubviews(mySubscribe, tvingCash)
        mySubscribe.addSubviews(myTicketsLabel, myTicketsIcon, usingTickets)
        tvingCash.addSubviews(tvingCashIcon, tvingCashLabel, myTvingCash)
    }
    
    private func makeConstraints() {
        profileContainer.snp.makeConstraints {
            $0.height.equalTo(74)
            $0.width.equalToSuperview()
        }
        mySubscribeContainer.snp.makeConstraints {
            $0.top.equalTo(self.profileContainer.snp.bottom).inset(-29)
            $0.height.equalTo(92)
            $0.leading.trailing.equalToSuperview().inset(10)
            //            $0.height.equalTo(300)
        }
        
        subscribe.snp.makeConstraints {
            $0.top.equalTo(self.mySubscribeContainer.snp.bottom).inset(-12)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        profileImage.snp.makeConstraints {
            $0.centerY.equalTo(self.profileContainer.snp.centerY)
            $0.leading.equalTo(10)
            $0.width.equalTo(72)
            $0.height.equalTo(74)
        }
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.profileImage.snp.centerY)
            
            $0.leading.equalTo(self.profileImage.snp.trailing).inset(-17)
            $0.height.equalTo(22)
        }
        editProfileButton.snp.makeConstraints {
            $0.leading.equalTo(self.nameLabel.snp.trailing).inset(-5)
            $0.centerY.equalTo(self.profileImage.snp.centerY)
            $0.width.height.equalTo(14)
        }
        switchProfileButton.snp.makeConstraints {
            $0.centerY.equalTo(self.profileImage.snp.centerY)
            
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(85)
            $0.height.equalTo(30)
        }
        
        mySubscribe.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(1.0/2.0)
        }
        tvingCash.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.width.equalToSuperview()
            $0.top.equalTo(self.mySubscribe.snp.bottom)
            $0.height.equalToSuperview().multipliedBy(1.0/2.0)
        }
        
        myTicketsIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
            $0.height.width.equalTo(23)
        }
        tvingCashIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
            $0.height.width.equalTo(23)
        }
        
        myTicketsLabel.snp.makeConstraints {
            $0.leading.equalTo(self.myTicketsIcon.snp.trailing).inset(-10)
            
            $0.centerY.equalToSuperview()
        }
        tvingCashLabel.snp.makeConstraints {
            $0.leading.equalTo(self.tvingCashIcon.snp.trailing).inset(-10)
            
            $0.centerY.equalToSuperview()
        }
        
        usingTickets.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.width.equalTo(240)
            
            $0.centerY.equalToSuperview()
        }
        myTvingCash.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            
            $0.centerY.equalToSuperview()
        }
    }
}

