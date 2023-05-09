//
//  CollectionCell.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/03.
//

import UIKit

class PosterCell : UICollectionViewCell {
    
    var cellHeight: CGFloat { 51 }
    //    var handler: (() -> (Void))?
    lazy var titleLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 10)
        $0.textColor = .tvingWhite
        $0.textAlignment = .left
        //        $0.sizeToFit()
    }
    static let identifier = "PosterCell"
    
    let posterImage = UIImageView().then {
        $0.image = UIImage(named: "Image")
    }
    //    let button = UIButton()
    
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
        
        //        button.do {
        //            $0.tintColor = .white
        //            $0.addTarget(self,
        //                         action: #selector(heartButtonTapped),
        //                         for: .touchUpInside)
        //        }
    }
    
    func setLayout() {
        [
            titleLabel,
            posterImage
        ].forEach { addSubview($0) }
        
        posterImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImage.snp.bottom).inset(-3)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
    }
    
    func configureCell(_ poster: Photo) {
        
        posterImage.image = poster.image
    }
}




//
//
////    var handler: (() -> (Void))?
//
//    static let identifier = "PosterCell"
//
//    let posterImage = UIImageView().then {
//        $0.image = UIImage(named: "Image")
//    }
////    let button = UIButton()
//
//    override init(frame: CGRect) {
//           super.init(frame: frame)
//
//        setStyle()
//        setLayout()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setStyle() {
//
////        button.do {
////            $0.tintColor = .systemPink
////            $0.addTarget(self,
////                         action: #selector(heartButtonTapped),
////                         for: .touchUpInside)
////        }
//    }
//
//    func setLayout() {
//
//        contentView.addSubview(posterImage)
////        contentView.addSubview(button)
//
//        posterImage.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
////        button.snp.makeConstraints {
////            $0.leading.bottom.equalToSuperview().inset(5)
////            $0.size.equalTo(30)
////        }
//    }
//
////    func tapped() {
////        let image = isTapped ? "heart.fill" : "heart"
////        button.setImage(UIImage(systemName: image), for: .normal)
////    }
//
////    @objc
////    func heartButtonTapped() {
////        handler?()
////    }
////
////    func configureCell(_ poster: Poster) {
////
////        posterImage.image = poster.image
////    }
//}
//
