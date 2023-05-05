//
//  PagingCollectionViewCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/04.
//

import UIKit
import SnapKit

class PagingCollectionViewCell: UICollectionViewCell {
    
    
 
        static let identifier = "PagingCollectionViewCell"
    
    
        private lazy var contentLabel: UILabel = {
            let label = UILabel()
    
    //        label.font = UIFont(name: "Pretendard-Medium", size: 15)
    //        label.textAlignment = .center
            label.backgroundColor = .systemPink
    
            return label
        }()
    
        func setupView(title: String) {
            setupLayout()
    //        contentLabel.text = title
        }
}
//
private extension PagingCollectionViewCell {
    func setupLayout() {
        addSubview(contentLabel)
        
        contentLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
