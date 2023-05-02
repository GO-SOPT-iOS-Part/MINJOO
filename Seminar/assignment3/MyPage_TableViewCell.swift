//
//  EditProfile_TableView.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/26.
//

import UIKit

import SnapKit
import Then

final class MyPage_TableViewCell: UITableViewCell {
    
    static let identifier = "MyPageTableViewCell"
    
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
    }
    
    func setLayout() {
        
        [label, buttonImage]
            .forEach { contentView.addSubview($0) }

        label.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)

            $0.centerY.equalToSuperview()
        }
        
        buttonImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(16.5)
        }
    }
    
    func configureCell(_ mypage: MyPage) {
        label.text = mypage.label
    }
}
