//
//  CollectionCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/03.
//

import UIKit

class PosterCell : UICollectionViewCell {
    
//    var handler: (() -> (Void))?
    
    static let identifier = "PosterCell"
    
    let posterImage = UIImageView()
    let button = UIButton()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
       
        setStyle()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        
        button.do {
            $0.tintColor = .white
//            $0.addTarget(self,
//                         action: #selector(heartButtonTapped),
//                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        contentView.addSubview(posterImage)
        contentView.addSubview(button)
        
        posterImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(5)
            $0.size.equalTo(30)
        }
    }
    
//    func tapped() {
//        let image = isTapped ? "heart.fill" : "heart"
//        button.setImage(UIImage(systemName: image), for: .normal)
//    }
    
//    @objc
//    func heartButtonTapped() {
//        handler?()
//    }
//
    func configureCell(_ poster: Poster) {
        
        posterImage.image = poster.image
    }
}

