//
//  CarrotTableViewCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/22.
//

import UIKit

import SnapKit
import Then

final class CarrotTableViewCell: UITableViewCell {
    
    static let identifier = "CarrotTableViewCell"
    
    private lazy var carrotImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let reservationLabel = UILabel()
    private let priceLabel = UILabel()
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
        
        carrotImage.do {
            $0.makeRounded(radius: 5)
        }
        
        productLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        
        placeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        timeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        reservationLabel.do {
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 11)
            $0.makeRounded(radius: 3)
        }
        
        priceLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
        }
        
        horizontalStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
        }
    }
    
    func setLayout() {
        
        [carrotImage, productLabel, placeLabel,
         timeLabel, horizontalStackView]
            .forEach { contentView.addSubview($0) }
        
        [reservationLabel, priceLabel]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        
        carrotImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalTo(carrotImage.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(10)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(productLabel.self)
            $0.top.equalTo(productLabel.snp.bottom).offset(6)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.snp.trailing).offset(3)
            $0.top.equalTo(placeLabel.self)
        }
        
        reservationLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(50)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.self)
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.height.equalTo(30)
        }
    }
    
    func configureCell(_ carrot: Carrot) {
        
        switch carrot.tradeStatus {
        case .reservation:
            self.reservationLabel.text = "예약중"
        case .completed:
            self.reservationLabel.text = "거래완료"
        case .shared:
            self.reservationLabel.text = "나눔완료"
        case .clear:
            self.reservationLabel.text = ""
        }
        
        carrotImage.image = carrot.image
        productLabel.text = carrot.product
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        
        reservationLabel.text = carrot.tradeStatus.title
        reservationLabel.backgroundColor = carrot.tradeStatus.backgroundColor
        
        reservationLabel.isHidden = carrot.tradeStatus == .clear
        
        var price = String(carrot.price)
        
        price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
        priceLabel.text = price + "원"
    }
}
