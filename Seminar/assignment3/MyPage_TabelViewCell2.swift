//
//  MyPage_TabelViewCell2.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/27.
//


import UIKit

import SnapKit
import Then

final class MyPage_TableViewCell2: UITableViewCell {
    
    
    
    static let identifier = "MyPageTableViewCell2"
    
    private lazy var label = UILabel()
    private lazy var buttonImage = UIImageView()
    private let horizontalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        separatorInset.left = 0
        
        selectionStyle = .none
        backgroundColor = .tvingBlack
        
        label.do {
            $0.font = UIFont(name: "Pretendard-Medium", size: 15)
            $0.textColor = .gray612
        }
        
        buttonImage.do {
            $0.image = UIImage(named: "MyPageButtonImage")
        }
//
//        placeLabel.do {
//            $0.font = UIFont.boldSystemFont(ofSize: 11)
//        }
//
//        timeLabel.do {
//            $0.font = UIFont.boldSystemFont(ofSize: 11)
//        }
//
//        reservationLabel.do {
//            $0.textAlignment = .center
//            $0.textColor = .white
//            $0.font = UIFont.boldSystemFont(ofSize: 11)
//            $0.makeRounded(radius: 3)
//        }
//
//        priceLabel.do {
//            $0.font = UIFont.boldSystemFont(ofSize: 13)
//        }
        
//        horizontalStackView.do {
//            $0.axis = .horizontal
//            $0.distribution = .fill
//            $0.alignment = .center
//            $0.spacing = 5
//        }
    }
    
    func setLayout() {
        
        [label, buttonImage, horizontalStackView]
            .forEach { contentView.addSubview($0) }
        
//        [reservationLabel, priceLabel]
//            .forEach { horizontalStackView.addArrangedSubview($0) }
//
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)

            $0.centerY.equalToSuperview()
        }
        
        buttonImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18.86)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(16.5)
        }
//
//        placeLabel.snp.makeConstraints {
//            $0.leading.equalTo(productLabel.self)
//            $0.top.equalTo(productLabel.snp.bottom).offset(6)
//        }
//
//        timeLabel.snp.makeConstraints {
//            $0.leading.equalTo(placeLabel.snp.trailing).offset(3)
//            $0.top.equalTo(placeLabel.self)
//        }
//
//        reservationLabel.snp.makeConstraints {
//            $0.height.equalTo(20)
//            $0.width.equalTo(50)
//        }
        
//        horizontalStackView.snp.makeConstraints {
//            $0.leading.equalTo(placeLabel.self)
//            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
//            $0.height.equalTo(30)
//        }
    }
    
    func configureCell2(_ mypage: MyPage) {

        
        label.text = mypage.label
    }
    
//    class TableViewCell: UITableViewCell {
//
//        // ⭐️ ViewController와 강한 참조 순환이 발생하기 때문에 반드시 weak로 선언!!
//        weak var delegate: ButtonTappedDelegate?
//
//        // ....
//    }
}
