//
//  MainPagePosterCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class MainPagePosterCell: UICollectionViewCell {
    
    var isTapped: Bool = false {
        didSet {
//            tapped()
        }
    }
    
    var handler: (() -> (Void))?
    
    static let identifier = "PhotoCell"
    
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
//
//    @objc
//    func heartButtonTapped() {
//        handler?()
//    }
//
    func configureCell(_ poster: Photo) {
        
        posterImage.image = poster.image
        isTapped = poster.heartTapped
    }
}
