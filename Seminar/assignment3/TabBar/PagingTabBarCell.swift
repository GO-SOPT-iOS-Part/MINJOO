//
//  PagingTabBarCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/04.
//

import UIKit
import SnapKit

class PagingTabBarCell: UICollectionViewCell {
    
    static let identifier = "PagingTabBarCell"
    
    lazy var titleLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 15)
        $0.textColor = .tvingWhite
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private lazy var underline = UIView().then {
        
        $0.backgroundColor = .tvingWhite
        $0.alpha = 0.0
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.font = isSelected ? UIFont(name: "Pretendard-Bold", size: 15) : UIFont(name: "Pretendard-Medium", size: 15)
            underline.alpha = isSelected ? 1.0 : 0.0
        }
    }
    
    func setupView(title: String) {
        Layout()
        titleLabel.text = title
    }
}

private extension PagingTabBarCell {
    func Layout() {
        [
            titleLabel,
            underline
        ].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        underline.snp.makeConstraints {
            $0.height.equalTo(3.0)
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.width.equalTo(titleLabel.snp.width)
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.bottom.equalToSuperview()
        }
    }
}
