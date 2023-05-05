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
    
    public var text: String?
    
    private lazy var profileContainer = UIView()
    
    private lazy var mySubscribeContainer = UIView().then {
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 3
        $0.layoutMargins = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 20.0, right: 0.0)
        
    }
    
    private lazy var subscribe = UIButton().then {
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 3
        
        $0.titleLabel?.numberOfLines = 2
        $0.setTitle("이용권을 구매하고 \t\t    등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!", for: .normal)
        $0.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 12)
        $0.titleLabel?.sizeToFit()
        $0.setTitleColor(.gray612, for: .normal)
        $0.titleLabel?.setLineSpacing(spacing: 1.4)
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom: 6, right: 0)
        
    }
    
    private let jtbcIcon = UIImageView().then {
        $0.image = UIImage(named: "JTBC")
    }
    private let tvnIcon = UIImageView().then {
        $0.image = UIImage(named: "TVN")
    }
    private let buttonImage = UIImageView().then {
        $0.image = UIImage(named: "MyPageButtonImage")
    }
    
    private lazy var mySubscribe = UIView()
    
    private lazy var tvingCash = UIView()
    
    private lazy var profileImage = UIImageView ().then {
        $0.image = UIImage(named: "profileImage")
        $0.layer.cornerRadius = 3
        $0.backgroundColor = .gray180
    }
    
    let nameLabel = UIButton().then {
    
        $0.setTitle("공듀", for: .normal)
        $0.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        $0.titleLabel?.font = UIFont(name: "Pretendard-Semibold", size: 20)
        $0.titleLabel?.sizeToFit()
        $0.setTitleColor(.tvingWhite, for: .normal)
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
    
    private let usingTickets = UIButton().then {
        $0.setTitle("사용중인 이용권이 없습니다.", for: .normal)
        $0.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 13)
        $0.setTitleColor(.gray384, for: .normal)
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
        addSubviews ( profileContainer, mySubscribeContainer, subscribe )
        profileContainer.addSubviews ( profileImage, nameLabel, editProfileButton, switchProfileButton )
        mySubscribe.addSubviews ( myTicketsLabel, myTicketsIcon, usingTickets )
        tvingCash.addSubviews ( tvingCashIcon, tvingCashLabel, myTvingCash )
        mySubscribeContainer.addSubviews ( mySubscribe, tvingCash )
        subscribe.addSubviews ( jtbcIcon, tvnIcon, buttonImage )
    }
    
    private func makeConstraints() {
        profileContainer.snp.makeConstraints {
            $0.height.equalTo(74)
            $0.width.equalToSuperview()
            $0.top.equalToSuperview().inset(30)
        }
        mySubscribeContainer.snp.makeConstraints {
            $0.top.equalTo(self.profileContainer.snp.bottom).inset(-25)
            $0.height.equalTo(92)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        subscribe.snp.makeConstraints {
            $0.top.equalTo(self.mySubscribeContainer.snp.bottom).inset(-10)
            $0.height.equalTo(65)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        profileImage.snp.makeConstraints {
            $0.centerY.equalTo(self.profileContainer.snp.centerY)
            $0.leading.equalTo(5)
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
            $0.trailing.equalToSuperview().inset(5)
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
            $0.leading.equalToSuperview().inset(15)
            $0.height.width.equalTo(17)
        }
        
        tvingCashIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.width.equalTo(17)
        }
        
        myTicketsLabel.snp.makeConstraints {
            $0.leading.equalTo(self.myTicketsIcon.snp.trailing).inset(-7)
            
            $0.centerY.equalToSuperview()
        }
        
        tvingCashLabel.snp.makeConstraints {
            $0.leading.equalTo(self.tvingCashIcon.snp.trailing).inset(-7)
            
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
        
        jtbcIcon.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.leading.equalToSuperview().inset(128)
            $0.top.equalToSuperview().inset(3)
        }
        
        tvnIcon.snp.makeConstraints {
            $0.width.equalTo(25)
            $0.leading.equalToSuperview().inset(105)
            $0.top.equalToSuperview().inset(17)
        }
        
        buttonImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18.86)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(16.5)
        }
    }
}

