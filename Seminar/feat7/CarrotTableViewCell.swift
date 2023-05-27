//
//  CarrotTableViewCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/22.
//

import UIKit

import SnapKit
import Then
import RealmSwift

final class CarrotTableViewCell: UITableViewCell {
    
    static let identifier = "CarrotTableViewCell"
    let localRealm = try! Realm()
    
    var id = 0
    private lazy var carrotImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let reservationLabel = UILabel()
    private let priceLabel = UILabel()
    private let horizontalStackView = UIStackView()
    public lazy var starButton = UIButton()
    
    var handler: (() -> Void)?
    
    var isTapped: Bool = false {
        didSet {
            updateButton()
        }
    }
    
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
        
        starButton.do {
            $0.setImage(UIImage(systemName: "star"), for: .normal)
            $0.tintColor = .systemYellow
            $0.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        [carrotImage, productLabel, placeLabel,
         timeLabel, horizontalStackView, starButton]
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
        
        starButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configureCell(_ carrot: Carrot) {
        
        switch carrot.tradeStatus {
        case "예약중":
            self.reservationLabel.backgroundColor = .systemGreen
        case "거래완료":
            self.reservationLabel.backgroundColor = .black
        case "나눔완료":
            self.reservationLabel.backgroundColor = .gray
        default:
            self.reservationLabel.backgroundColor = .white
        }
        
        carrotImage.image = UIImage(named: carrot.image)
        productLabel.text = carrot.product
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        
        reservationLabel.text = carrot.tradeStatus
        
        reservationLabel.isHidden = carrot.tradeStatus == ""
        
        var price = String(carrot.price)
        
        price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
        priceLabel.text = price + "원"
    }
    
    @objc func starButtonTapped() {
        self.isTapped.toggle()
        handler?()
//        try! localRealm.write {
//            localRealm.add()
//        }
        
        print(starButton.tag)
    
        let price = Int(priceLabel.text!) ?? 0
        
        let task = Carrot(id: id, image: "", product: productLabel.text!, place: placeLabel.text!, time: timeLabel.text!, tradeStatus: reservationLabel.text!, price: price, star: true)
        
        try! localRealm.write {
            localRealm.add(task)
        }
        
    }
    
    func updateButton() {
        let image = isTapped ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        starButton.setImage(image, for: .normal)
    }
    
}
